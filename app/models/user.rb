# frozen_string_literal: true

require 'date'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :date_of_birth, type: Date
  field :gender, type: String
  field :line_id, type: String
  field :church_name, type: String

  validates :name, :date_of_birth, :gender, :line_id, presence: true
  validates :name, uniqueness: true

  has_many :attendance_records, dependent: :delete_all

  def as_json(_options = {})
    {
      id: id.to_s,
      name:,
      gender:,
      grade:,
      line_id:,
      church_name:,
      date_of_birth:
    }
  end

  def grade
    academic_year(Time.zone.today) - academic_year(date_of_birth)
  end

  private

  def academic_year(date)
    date.month >= 9 ? date.year + 1 : date.year
  end
end
