class Church
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  validates_presence_of :name

  def as_json(options = {})
    { name: name }
  end
end
