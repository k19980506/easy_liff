# frozen_string_literal: true

class AttendanceRecordResource < ApplicationResource
  attribute(:id) { |resource| resource.id.to_s }
  attribute(:name) { |resource| User.find(resource.user_id).name }
  attribute(:gender) { |resource| User.find(resource.user_id).gender }
  attribute(:age) { |resource| User.find(resource.user_id).age }
  attribute(:church_name) { |resource| User.find(resource.user_id).church_name }
  attribute(:title) { |resource| Event.find(resource.event_id).title }
  attributes :attendance, :attendance_status
end
