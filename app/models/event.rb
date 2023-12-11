# frozen_string_literal: true

require 'date'

class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :options, type: Array

  validates :title, :start_date, :end_date, :options, presence: true
  validates :title, uniqueness: true

  has_many :attendance_records, dependent: :delete_all

  def report
    {
      total: report_base('all'),
      neli: report_base('內壢'),
      xizhi: report_base('汐止'),
      sanchong: report_base('三重'),
      yongkong: report_base('永康')
    }
  end

  def report_base(church_name)
    @church_name = church_name
    {
      total_member: total_member.count,
      total_male_member: total_male_member.count,
      total_female_member: total_female_member.count,
      total_baby_member:,
      total_primary_member:,
      total_junior_member:,
      details: meal_report
    }
  end

  def meal_report
    options.map do |option|
      date = option['date']
      {
        date:,
        status: {
          breakfast: count_dining_number('breakfast', date),
          lunch: count_dining_number('lunch', date),
          dinner: count_dining_number('dinner', date),
          accommodation: count_staying_number(date)
        }
      }
    end
  end

  def total_records
    AttendanceRecord.where('event_id' => id.to_s, 'attendance' => true)
  end

  def total_member
    user_ids = total_records.pluck(:user_id)

    get_users_by_church_name(user_ids)
  end

  def total_male_member
    total_member.where(gender: 'male')
  end

  def total_female_member
    total_member.where(gender: 'female')
  end

  def total_baby_member
    total_member.count { |user| user.grade < 7 }
  end

  def total_primary_member
    total_member.count { |user| user.grade > 6 && user.grade < 10 }
  end

  def total_junior_member
    total_member.count { |user| user.grade > 9 && user.grade < 13 }
  end

  def count_dining_number(type, date)
    user_ids = AttendanceRecord.where('attendance_status' => { '$elemMatch' => { 'date' => date.to_s,
                                                                                 "status.#{type}" => true } }).pluck(:user_id)
    users = get_users_by_church_name(user_ids)

    {
      adult: users.count { |user| user.grade > 12 },
      child: users.count { |user| user.grade <= 12 }
    }
  end

  def count_staying_number(date)
    user_ids = AttendanceRecord.where('attendance_status' => { '$elemMatch' => { 'date' => date.to_s,
                                                                                 'status.accommodation' => true } }).pluck(:user_id)
    users = get_users_by_church_name(user_ids)
    {
      male: users.where(gender: 'male').count,
      female: users.where(gender: 'female').count
    }
  end

  def get_users_by_church_name(user_ids)
    if @church_name == 'all'
      User.in(id: user_ids)
    else
      User.in(id: user_ids).where(church_name: @church_name)
    end
  end
end
