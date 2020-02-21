require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I can search for a book and its reviews' do
    it 'by entering the title into the search form on the index page' do
      visit '/'

      fill_in :title, "the man who saw everything"

      click_button 'Find Book'

      expect(current_path).to eq('/search')

      expect(page).to have_css('.title')
      expect(page).to have_css('.author')
      #subjects are genres are in the return data
      expect(page).to have_css('.genres')

      #reviews are the summary in the response
      expect(page).to have_content('Reviews: 2')
      within("#reviews") do
        #expect there to be 2 sections of specific review data
        #first review
        expect(page).to have_content("Review Publication Date: 2019-10-09")
        expect(page).to have_content("Review Description")
        #second review
        expect(page).to have_content("Review Publication Date: 2019-10-15")
        expect(page).to have_content("Review Description")

      end
    end
  end
end

# As a user
# When I visit "/"
# And I input "the man who saw everything" into the form
# (Note: Use the existing search form)
# And I click "Find Book"
# Then I should be on page "/search"
# Then I should see the book's info
# For that book I should see
# - Title
# - Author
# - Genres
# (Note: genres is referred to as "subjects" in the book search response)
# I should also see:
# - This book has 2 reviews from the New York Times
#   (Note: reviews are the "summary" in the book review response)
# - Review 1: ""The Man Who Saw Everything,"" which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at "authoritarian old men.""
# Review Publication Date: 2019-10-09
# - Review 2: "Deborah Levy's latest novel, "The Man Who Saw Everything," experiments with time travel, history and the endless complications of love."
# Review Publication Date: 2019-10-15