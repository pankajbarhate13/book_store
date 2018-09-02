require 'faker'
include  Faker


100.times do
 author = Author.create(name: Faker::Book.title, bio: Faker::Book.description, pic: Faker::Avatar.image, academaics: Faker::Science.element, awards:  Faker::Movie.quote)
end

@genre = ["Science fiction", "Satire", "Drama", "Action and Adventure", "Romance", "Mystery", "Horror", "Self help", "Fantasy"]

500.times do
	books = Book.create(name: Faker::Book.title, short_description: Faker::Company.catch_phrase, long_description: Faker::Company.catch_phrase, book_index:Faker::Code.isnb, publish_at: Faker::Time.backward(100, :evening) )

	book_genere = BookGenre.create(book_id: books.id, name: @genre.sample)
end


250.times do 
	reviews = Review.create(name: Faker::Name.name , rating: rand(0.0...5.0) , title: Faker::Restaurant.review, description: Faker::Book.description)
end

