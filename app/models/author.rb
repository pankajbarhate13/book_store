class Author
  include Mongoid::Document
  field :name, type: String
  field :bio, type: String
  field :pic, type: String
  field :academaics, type: String
  field :awards, type: String


  validates :bio, length: { minimum: 50, maximum: 100 }
end
