# frozen_string_literal: true

class AttendanceRecordResource < ApplicationResource
  attribute(:id) { |resource| resource.id.to_s }
  attribute(:name) { |resource| resource.user.name }
  attribute(:gender) { |resource| resource.user.gender }
  attribute(:grade) { |resource| resource.user.grade }
  attribute(:church_name) { |resource| resource.user.church_name }
  attribute(:title) { |resource| resource.event.title }
  attributes :attendance, :attendance_status
end
