class SearchController < ApplicationController
  def index

    book_info = LibraryService.new.get_book(params[:title])
    @book = Book.new(book_info)

    reviews_info = NytService.new.get_reviews(params[:title])

    @reviews = reviews_info.map do |review_info|
      Review.new(review_info)
    end
  end
end
