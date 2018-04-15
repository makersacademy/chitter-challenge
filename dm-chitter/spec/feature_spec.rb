require 'app'
require 'helper_methods'

feature "the user enters a tweet into the database" do

  before (:each) do
    visit_homepage
  end

  scenario "the tweet is successfully added" do
    add_successful_tweet
    expect(page).to have_content "The tweet was successfully added."
    page.has_content? "welcome to chitter"
  end

  scenario "the tweet is > 240 characters" do
    tweet_too_long
    expect(page).to have_content "The tweet is too long. Ensure tweet < 240 characters"
  end

  scenario "the user tries to submit an empty tweet" do
    tweet_too_short
    expect(page).to have_content "The tweet is too short."
  end

end