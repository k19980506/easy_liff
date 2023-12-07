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

  def as_json(_options = {})
    {
      id: id.to_s,
      name:,
      gender:,
      age: calculate_age,
      line_id:,
      church_name:,
      date_of_birth:
    }
  end

  def age
    Time.zone.today.year - date_of_birth.year
  end

  private

  def calculate_age
    return if date_of_birth.blank?

    Time.zone.today.year - date_of_birth.year
  end
end
