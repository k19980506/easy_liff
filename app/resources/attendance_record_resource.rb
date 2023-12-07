# frozen_string_literal: true

class AttendanceRecordResource < ApplicationResource
  attribute(:name) { |resource| User.find(resource.user_id).name }
  attribute(:gender) { |resource| User.find(resource.user_id).gender }
  attribute(:age) { |resource| User.find(resource.user_id).age }
  attribute(:title) { |resource| Event.find(resource.event_id).title }
  attributes :attendance_status
end
