class Review
  include Mongoid::Document
  field :name, type: String
  field :rating, type: Integer
  field :title, type: String
  field :description, type: String

  validates :rating, length: { minimum: 0, maximum: 5 }
end
