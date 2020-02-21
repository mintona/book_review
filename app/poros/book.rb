class Book
  attr_reader :title, :author, :publisher, :genres
  def initialize(book_info)
    @title = book_info[:title]
    @author = book_info[:author_name]
    @publisher = book_info[:publisher]
    @genres = book_info[:subject]
  end
end
