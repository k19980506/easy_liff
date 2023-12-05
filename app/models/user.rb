require "Date"

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :date_of_birth, type: Date
  field :gender, type: String
  field :line_id, type: String
  field :church_name, type: String

  has_many :attendance_records

  validates_presence_of :name, :date_of_birth, :gender, :line_id

  def as_json(options = {})
    {
      id: id.to_s,
      name:,
      gender:,
      age: calculate_age,
      line_id:,
      church_name:,
    }
  end

  private

  def calculate_age
    return unless date_of_birth.present?

    Date.today.year - date_of_birth.year
  end
end
