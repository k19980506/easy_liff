# frozen_string_literal: true

require 'Date'

class AttendanceRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :attendance_status, type: Array
  field :user_id, type: String
  field :event_id, type: String

  validates :attendance_status, :user_id, :event_id, presence: true

  def as_json(_options = {})
    {
      id: id.to_s,
      user_id:,
      event_id:,
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
