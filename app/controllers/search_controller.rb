class SearchController < ApplicationController
  def index
    library_conn = Faraday.new(:url => 'http://openlibrary.org/search.json?')
    library_response = library_conn.get do |req|
      req.params['title'] = params[:title]
    end

    book_hash = JSON.parse(library_response.body, symbolize_names: true)[:docs].first

    @book = Book.new(book_hash)

    nyt_response = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{params[:title]}&api-key=#{ENV['KEY']}")
    nyt_hash = JSON.parse(nyt_response.body, symbolize_names: true)

    reviews_hash = nyt_hash[:results]
    @reviews = reviews_hash.map do |review_info|
      Review.new(review_info)
    end
  end
end
