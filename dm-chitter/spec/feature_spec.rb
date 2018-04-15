require 'app'
require 'helper_methods'

feature "the user signs up to cheeter as a user" do

  before (:each) do
    visit_login
  end

  scenario "the user does not sign up with a valid email" do
    no_email_signup
    page.has_content? "Please signup with valid email/password"
  end

  scenario "the user does not sign up with a valid password" do
    no_password_signup
    page.has_content? "Please signup with a valid email/password" 
  end

end

feature "the user logs into cheeter as an existing user" do

  before(:each) do
    visit_login
  end

  scenario "the user does not enter an ID or password" do
    signin_with_nothing
    expect(page).to have_content "Login failed, please login with the correct credentials."
  end

  scenario "the user tries to login but needs to create an account/check they are a user" do
    signin_as_user
    expect(page).to have_content "Login failed, please login with the correct credentials."
  end

end

feature "the user enters a tweet into the database" do

  before (:each) do
    successful_login
  end

  scenario "the usersname is included in page welcome" do
    page.has_content?("Welcome to Chitter, tester@gmail.com")
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