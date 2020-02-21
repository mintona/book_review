class Review
  attr_reader :publication_date, :summary
  def initialize(review_info)
    @publication_date = review_info[:publication_dt]
    @summary = review_info[:summary]
  end
end 
