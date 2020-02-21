require 'rails_helper'

describe 'Book' do
  it 'exists with attributes' do
    book_info = {
      title: "The Man Who Saw Everything",
      publisher: ["Bloomsbury Publisher"],
      author_name: ["Deborah Levy"]
    }
    book = Book.new(book_info)
#ADD A BOOK W/ GENRES
    expect(book).to be_a Book
    expect(book.title).to eq("The Man Who Saw Everything")
    expect(book.publisher).to eq(["Bloomsbury Publisher"])
    expect(book.author).to eq(["Deborah Levy"])
    expect(book.genres).to eq(nil)
  end
end
