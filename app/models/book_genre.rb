class BookGenre
  include Mongoid::Document
  field :book_id, type: Integer
  field :name, type: String

  belongs_to :book
end
