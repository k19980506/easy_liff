# frozen_string_literal: true

require 'date'

class AttendanceRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: String
  field :event_id, type: String
  field :attendance, type: Boolean
  field :attendance_status, type: Array, default: []

  validates :user_id, :event_id, :attendance, presence: true
  validates :user_id, uniqueness: { scope: :event_id }
end
