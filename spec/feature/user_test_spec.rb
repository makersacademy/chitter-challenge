require './chitter'

RSpec.describe 'feature tests' do
  include Mail::Matchers
  before(:each) do
    test_db_initialise
    # User.assign_user(nil)
  end

# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#

  feature 'feature tests' do

    scenario 'user sees the homepage' do
      visit('/')
      expect(page).to have_content "Chitter"
      expect(page.status_code).to be(200)
    end

# You don't have to be logged in to see the peeps.

    scenario 'peeps are seen on the homepage' do
      visit('/')
      expect(page).to have_content "The first peep in the test database"
      expect(page).to have_content "The sixth peep in the test database"
      expect(page.status_code).to be(200)
    end

# Peeps (posts to chitter) have the name of the maker and their user handle.

    scenario 'user can post peeps when logged in' do
      perform_valid_login
      click_link "New Peep!"
      fill_in "message", with: "This is a new peep"
      click_on "Peep!"
      expect(page).to have_content "This is a new peep"
      expect(page.text).to match(/Alice Smith @al123/)
      expect(page.status_code).to be(200)
    end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#

    scenario 'user sees peeps in reverse chronological order' do
      visit('/')
      expect("second peep").to appear_before("first peep")
      expect(page.status_code).to be(200)
    end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

    scenario 'user sees peep timestamps' do
      visit('/')
      expect(page.body).to match(/#{TIMESTAMP_REGEX}/)
      expect(page.status_code).to be(200)
    end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
#

# Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).

    scenario 'user can signup a new account' do
      visit_signup_page
      fill_in "username", with: "newuser"
      fill_in "password", with: "newpassword"
      fill_in "forename", with: "Mike"
      fill_in "surname", with: "Smith"
      fill_in "email", with: "mike.smith@google.com"
      click_on "Submit"
      expect(page).to have_content "newuser"
      expect(page.status_code).to be(200)
    end

# The username and email are unique.

    scenario 'user cannot signup a new account with duplicate username' do
      visit_signup_page
      fill_in "username", with: "al123"
      fill_in "password", with: "this"
      fill_in "forename", with: "user"
      fill_in "surname", with: "has"
      fill_in "email", with: "existing@username.com"
      click_on "Submit"
      expect(page).to have_content "Username has already been taken"
      expect(page.status_code).to be(200)
    end

    scenario 'user cannot signup a new account with duplicate email' do
      visit_signup_page
      fill_in "username", with: "This"
      fill_in "password", with: "User"
      fill_in "forename", with: "Has"
      fill_in "surname", with: "existingemail"
      fill_in "email", with: "alice.smith@gmail.com"
      click_on "Submit"
      expect(page).to have_content "Email has already been taken"
      expect(page.status_code).to be(200)
    end

# HARDER
#
# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
#

    scenario 'user can login if they exist' do
      perform_valid_login
      expect(page).to have_content "al123"
      expect(page.status_code).to be(200)
    end

    scenario 'user cant login if they dont exist' do
      visit_login_page
      fill_in "username", with: "baduser"
      fill_in "password", with: "wrongpassword"
      click_on "Submit"
      expect(page).to have_content "Invalid username or password. Try again"
      expect(page.status_code).to be(200)
    end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

    scenario 'user can logout' do
      visit_login_page
      fill_in "username", with: "nopeeps"
      fill_in "password", with: "password999"
      click_on "Submit"
      expect(page).to have_content "nopeeps"
      click_link "Logout"
      expect(page).not_to have_content "nopeeps"
      expect(page.status_code).to be(200)
    end

# ADVANCED
#
# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep

  # feature 'receive email when tagged' do
  #
  #     scenario 'receive email' do
  #       Mail::TestMailer.deliveries.clear
  #       perform_valid_login
  #       fill_in "message", with: "Hi there @bo123"
  #       click_on "Peep!"
  #       it { is_expected.to have_sent_email.to('bob.smith@gmail.com') }
  #     end
  # end

# Your README should indicate the technologies used, and give instructions on how to install and run the tests.
  end
end
