class Api::BooksController < ApplicationController
	before_action :authenticate_user!, only: :update

	def search
		if params[:text]
			@book_gen  =  BookGenre.where('name LIKE ?','%params[:text]%').pluck[:book_id] rescue nil
			@results = []
			@results << Book.where("id IN (?)", book_gen) if @book_gen

			@books = Book.where("name LIKE ? or short_description  LIKE ? or short_description LIKE ?", '%params[:text]%','%params[:text]%','%params[:text]%') 
			@results << @books if @books

			@authors = Author.where("name LIKE ? or bio  LIKE ? or awards LIKE ? or", '%params[:text]%', '%params[:text]%', '%params[:text]%')
			@results << @authors if @authors

			@reviews = Review.where("name LIKE ? or title  LIKE ? or description LIKE ? or", '%params[:text]%', '%params[:text]%', '%params[:text]%')
			@results << @reviews if @reviews

			if @results
				render json: {message: "Record Fund", status: 200}
			else
				render json: {message: "Record Not Found", status: 404}
			end
		else
			render json: {message: " Missing parameters.", status: 400}
		end

	end
end
