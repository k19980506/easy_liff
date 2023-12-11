# frozen_string_literal: true

class EventResource < ApplicationResource
  attribute(:id) { |resource| resource.id.to_s }
  attributes :title, :start_date, :end_date, :options
  attribute(:options) { |resource| formatted_options(resource.options) }

  private

  def formatted_options(options)
    options.map { |option| format_option(option) }
  end

  def format_option(option)
    {
      date: option['date'],
      status: format_status(option['status'], option['date'])
    }
  end

  def format_status(status, date)
    {
      breakfast: status['breakfast'],
      breakfast_count: count_users_with_status('breakfast', date),
      lunch: status['lunch'],
      lunch_count: count_users_with_status('lunch', date),
      dinner: status['dinner'],
      dinner_count: count_users_with_status('dinner', date),
      accommodation: status['accommodation'],
      accommodation_count: count_users_with_status('accommodation', date)
    }
  end

  def count_users_with_status(status, date)
    AttendanceRecord.where('attendance_status.date' => date.to_s, "attendance_status.status.#{status}" => 'true').count
  end
end
