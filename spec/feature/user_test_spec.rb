require './chitter'

RSpec.describe 'feature tests' do
  before(:each) do
    test_db_initialise
    User.assign_user(nil)
  end

# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#

  feature 'index' do

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

    scenario 'user can post peeps when logged in' do
      perform_valid_login
      click_link "New Peep!"
      fill_in "message", with: "This is a new peep"
      click_on "Peep!"
      expect(page).to have_content "This is a new peep"
      expect(page.status_code).to be(200)
    end

# Peeps (posts to chitter) have the name of the maker and their user handle.

    scenario 'user can see their name and username in peeps when posting' do
      perform_valid_login
      click_link "New Peep!"
      fill_in "message", with: "This is a new peep"
      click_on "Peep!"
      expect(page.text).to match(/Alice Smith @al123/)
      expect(page.status_code).to be(200)
    end

  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#

  feature 'multiple peeps in reverse chronological order' do

    scenario 'user sees peeps in reverse chronological order' do
      visit('/')
      expect("first peep").to appear_before("second peep")
      expect(page.status_code).to be(200)
    end

  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

  feature 'show timestamp of peeps' do

    scenario 'user sees peep timestamps' do
      visit('/')
      expect(page.body).to match(/#{TIMESTAMP_REGEX}/)
      expect(page.status_code).to be(200)
    end

  end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
#

# Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).

  feature 'sign up for chitter' do

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

  end
# HARDER
#
# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
#

  feature 'log in to chitter' do

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

  end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

  feature 'log out of chitter' do

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

  end

# ADVANCED
#
# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep

# Your README should indicate the technologies used, and give instructions on how to install and run the tests.

end
