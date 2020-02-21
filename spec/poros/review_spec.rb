require 'rails_helper'

RSpec.describe 'Review' do
  it 'exists with attributes' do
    review_info = {
                    :publication_dt=>"2019-10-09",
                    :byline=>"PARUL SEHGAL",
                    :book_title=>"The Man Who Saw Everything",
                    :book_author=>"Deborah Levy",
                    :summary=>"“The Man Who Saw Everything,” which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at “authoritarian old men.”",
    }

    review = Review.new(review_info)

    expect(review).to be_a Review

    expect(review.publication_date).to eq("2019-10-09")
    expect(review.summary).to eq("“The Man Who Saw Everything,” which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at “authoritarian old men.”")
  end
end
