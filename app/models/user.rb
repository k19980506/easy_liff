require "Date"

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :date_of_birth, type: Date
  field :gender, type: String
  field :line_id, type: String

  validates_presence_of :name, :date_of_birth, :gender, :line_id
end
