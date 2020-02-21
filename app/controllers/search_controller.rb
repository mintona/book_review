class SearchController < ApplicationController
  def index
    # still sending 2 instance variables into the view
    # next refactor step would be to make a facade to avoid this
    # and render local variables
    
    book_info = LibraryService.new.get_book(params[:title])
    @book = Book.new(book_info)

    reviews_info = NytService.new.get_reviews(params[:title])

    @reviews = reviews_info.map do |review_info|
      Review.new(review_info)
    end
  end
end
