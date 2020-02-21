class NytService

  def get_reviews(book_title)
    nyt_response = Faraday.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{book_title}&api-key=#{ENV['KEY']}")
    nyt_hash = JSON.parse(nyt_response.body, symbolize_names: true)[:results]
  end
end
