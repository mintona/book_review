class SearchController < ApplicationController
  def index

    book_info = LibraryService.new.get_book(params[:title])
    @book = Book.new(book_info)

    nyt_response = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{params[:title]}&api-key=#{ENV['KEY']}")
    nyt_hash = JSON.parse(nyt_response.body, symbolize_names: true)

    reviews_hash = nyt_hash[:results]
    @reviews = reviews_hash.map do |review_info|
      Review.new(review_info)
    end
  end
end
