# frozen_string_literal: true

require 'date'

class AttendanceRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :attendance_status, type: Array
  field :user_name, type: String
  field :event_title, type: String

  validates :attendance_status, :user_name, :event_title, presence: true
  validates :user_name, uniqueness: { scope: :event_title }

  def as_json(_options = {})
    {
      id: id.to_s,
      user_name:,
      event_title:,
      attendance_status: formatted_attendance_status
    }
  end

  private

  def formatted_attendance_status
    attendance_status.map do |detail|
      {
        date: detail['date'],
        status: {
          breakfast: detail['status']['breakfast'],
          lunch: detail['status']['lunch'],
          dinner: detail['status']['dinner'],
          accommodation: detail['status']['accommodation']
        }
      }
    end
  end
end
