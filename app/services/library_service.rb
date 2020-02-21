class LibraryService
  # this can be refactored into connection and response methods
  # ran out of time
  def get_book(book_title)
    library_conn = Faraday.new(:url => 'http://openlibrary.org/search.json?')
    library_response = library_conn.get do |req|
      req.params['title'] = book_title
    end
    JSON.parse(library_response.body, symbolize_names: true)[:docs].first
  end
end
