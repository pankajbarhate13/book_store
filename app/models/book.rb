class Book
  include Mongoid::Document
  field :name, type: String
  field :short_description, type: String
  field :long_description, type: String
  field :book_index, type: String
  field :publish_at, type: DateTime

  has_many :book_genres
end
