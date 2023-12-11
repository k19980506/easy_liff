# frozen_string_literal: true

require 'date'

class AttendanceRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  field :attendance, type: Boolean
  field :attendance_status, type: Array, default: []

  validates :attendance, presence: true
  validates :user, uniqueness: { scope: :event }

  belongs_to :user
  belongs_to :event
end
