class SearchController < ApplicationController
  def index

    book_info = LibraryService.new.get_book(params[:title])
    @book = Book.new(book_info)

    nyt_response = NytService.new.get_reviews(params[:title])

    nyt_hash = JSON.parse(nyt_response.body, symbolize_names: true)

    reviews_hash = nyt_hash[:results]
    @reviews = reviews_hash.map do |review_info|
      Review.new(review_info)
    end
  end
end
