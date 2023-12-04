require "Date"

class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :options, type: Array

  has_many :attendance_records

  validates_presence_of :title, :start_date, :end_date, :options

  def as_json(options = {})
    {
      id: id.to_s,
      title:,
      start_date:,
      end_date:,
      options: formatted_options,
    }
  end

  private

  def formatted_options
    options.map do |option|
      {
        date: option["date"],
        status: {
          breakfast: option["status"]["breakfast"],
          lunch: option["status"]["lunch"],
          dinner: option["status"]["dinner"],
          accommodation: option["status"]["accommodation"],
        },
      }
    end
  end
end
