require "Date"

class AttendanceRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :attendance_status, type: Array

  belongs_to :user
  belongs_to :event

  validates_presence_of :attendance_status, :user, :event

  def as_json(options = {})
    {
      id: id.to_s,
      user_id: user.id.to_s,
      event_id: event.id.to_s,
      attendance_status: formatted_attendance_status,
    }
  end

  private

  def formatted_attendance_status
    attendance_status.map do |detail|
      {
        date: detail["date"],
        status: {
          breakfast: detail["status"]["breakfast"],
          lunch: detail["status"]["lunch"],
          dinner: detail["status"]["dinner"],
          accommodation: detail["status"]["accommodation"],
        },
      }
    end
  end
end
