class SearchController < ApplicationController
  def index
    # http://openlibrary.org/search.json?title=the+man+who+saw+everything
    search_title = params[:title]
    conn = Faraday.new(:url => 'http://openlibrary.org/search.json?')
    response = conn.get do |req|
      req.params['title'] = search_title
    end

    book_hash = JSON.parse(response.body, symbolize_names: true)[:docs].first

    @book = Book.new(book_hash)
  end

end
