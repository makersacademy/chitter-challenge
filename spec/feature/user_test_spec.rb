require './chitter'

RSpec.describe 'feature tests' do
  before(:each) do
    test_db_initialise
    User.logged_in_user(nil)
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
    end

    scenario 'peeps are seen on the homepage' do
      visit('/')
      expect(page).to have_content "The first peep in the test database"
      expect(page).to have_content "The sixth peep in the test database"
    end

    scenario 'user can post peeps when logged in' do
      visit('/')
      click_link "Login"
      fill_in "username", with: "al123"
      fill_in "password", with: "password123"
      click_on "Submit"
      click_link "New Peep!"
      fill_in "message", with: "This is a new peep"
      click_on "Peep!"
      expect(page).to have_content "This is a new peep"
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
    end

  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

  feature 'show timestamp of peeps' do

    scenario 'user sees peep timestamps' do
      visit('/')
      expect(page.body).to match(/#{TIMESTAMP_REGEX}/)
    end

  end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
#

  feature 'sign up for chitter' do

    scenario 'user can signup a new account' do
      visit('/')
      click_link "Signup"
      fill_in "username", with: "newuser"
      fill_in "password", with: "newpassword"
      fill_in "forename", with: "Mike"
      fill_in "surname", with: "Smith"
      fill_in "email", with: "mike.smith@google.com"
      click_on "Submit"
      expect(page).to have_content "newuser"
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
    visit('/')
    click_link "Login"
    fill_in "username", with: "al123"
    fill_in "password", with: "password123"
    click_on "Submit"
    expect(page).to have_content "al123"
  end

  scenario 'user cant login if they dont exist' do
    visit('/')
    click_link "Login"
    fill_in "username", with: "baduser"
    fill_in "password", with: "wrongpassword"
    click_on "Submit"
    expect(page).to have_content "Invalid username or password. Try again"
  end

end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'log out of chitter' do

  scenario 'user can logout' do
    visit('/')
    click_link "Login"
    fill_in "username", with: "al123"
    fill_in "password", with: "password123"
    click_on "Submit"
    expect(page).to have_content "al123"
    click_link "Logout"
    expect(page).not_to have_content "al123"
  end

end

# ADVANCED
#
# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep

end
