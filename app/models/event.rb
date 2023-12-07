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

  def as_json(_options = {})
    {
      id: id.to_s,
      title:,
      start_date:,
      end_date:,
      options: formatted_options
    }
  end

  private

  def formatted_options
    options.map do |option|
      {
        date: option['date'],
        status: {
          breakfast: option['status']['breakfast'],
          breakfast_count: count_users_with_status('breakfast', option['date']),
          lunch: option['status']['lunch'],
          lunch_count: count_users_with_status('lunch', option['date']),
          dinner: option['status']['dinner'],
          dinner_count: count_users_with_status('dinner', option['date']),
          accommodation: option['status']['accommodation'],
          accommodation_count: count_users_with_status('accommodation', option['date'])
        }
      }
    end
  end

  def count_users_with_status(status, date)
    AttendanceRecord.where('attendance_status.date' => date.to_s, "attendance_status.status.#{status}" => 'true').count
  end
end
