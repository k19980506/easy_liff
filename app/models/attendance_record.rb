# frozen_string_literal: true

require 'date'

class AttendanceRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :attendance_status, type: Array
  field :user_id, type: String
  field :event_id, type: String

  validates :attendance_status, :user_id, :event_id, presence: true
  validates :user_id, uniqueness: { scope: :event_id }

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
