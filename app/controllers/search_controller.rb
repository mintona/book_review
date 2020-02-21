class SearchController < ApplicationController
  def index
    # http://openlibrary.org/search.json?title=the+man+who+saw+everything
    # title = hash["docs"].first["title_suggest"]
    # publisher = hash["docs"].first["Bloomsbury Publishing"]
    # author = hash["docs"].first["author_name"]
    search_title = params[:title]
    conn = Faraday.new(:url => 'http://openlibrary.org/search.json?')
    response = conn.get do |req|
      req.params['title'] = search_title
    end

    book_hash = JSON.parse(response.body)["docs"].first
    book_title = book_hash["title"]
    authors = book_hash["author_name"]
    publisher = book_hash["publisher"]
    genres = book_hash["subject"]
    require "pry"; binding.pry

    @book = Book.create(title: book_title, author: authors, publisher: publisher, genres: genres)
  end

end
