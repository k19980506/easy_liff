# frozen_string_literal: true

class Church
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  validates :name, presence: true

  def as_json(_options = {})
    { name: }
  end
end
