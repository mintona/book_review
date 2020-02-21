class LibraryService

  def get_book(book_title)
    library_conn = Faraday.new(:url => 'http://openlibrary.org/search.json?')
    library_response = library_conn.get do |req|
      req.params['title'] = book_title
    end
  end
end
