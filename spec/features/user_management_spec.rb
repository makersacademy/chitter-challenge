require 'spec_helper'

feature 'An error message will occur when' do

  scenario "a user attempts to sign in with a password that doesn't match" do
    expect{ sign_up('Paul', 'paul', 'wrong_password', 'paul', 'paul@paul.com')}.to change(User, :count).by 0
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "a user tries to sign in with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end
end

feature 'A user can sign out' do

   before(:each) do
      User.create(:name => "Paul",
                  :password => "paul",
                  :password_confirmation => "paul",
                  :username => "paulychops",
                  :email => 'paul@example.com')
    end

  scenario 'after signing in' do
    visit('/')
    sign_in('paul@example.com', 'paul')
    expect(page).to have_content("Welcome, Paul")
    click_button "Sign out"
    expect(current_path).to eq '/'
  end
end

feature 'The user count will increase' do

  scenario "when a new user visits the site" do
  expect{ sign_up }.to change(User, :count).by(1)
  expect(page).to have_content("Welcome, Paul")
  expect(User.first.email).to eq("paul@example.com")
  end
end

feature "User signs in" do

  before(:each) do
    User.create(:name => "Paul",
                :password => "paul",
                :password_confirmation => "paul",
                :username => "paulychops",
                :email => 'paul@example.com')
  end

  scenario 'with correct credentials' do
    visit('/')
    expect(page).not_to have_content("Welcome, Paul")
    sign_in('paul@example.com', 'paul')
    expect(page).to have_content("Welcome, Paul")
  end

  scenario 'with incorrect credentials' do
    visit('/')
    expect(page).not_to have_content("Welcome, Paul")
    sign_in('paul@example.com', 'wrong_password')
    expect(page).not_to have_content("Welcome, Paul")
  end

  scenario 'with wrong username' do
    visit('/')
    expect(page).not_to have_content("Welcome, Paul")
    sign_in('pauline@example.com', 'wrong_password')
    expect(page).not_to have_content("Welcome, Paul")
  end
end

feature 'User signs out' do
    before(:each) do
      User.create(:name => "Paul",
                  :password => "paul",
                  :password_confirmation => "paul",
                  :username => "paulychops",
                  :email => 'paul@example.com')
      end

  scenario 'while being signed in' do
    sign_in('paul@example.com', 'paul')
    click_button("Sign out")
    expect(page).not_to have_content("Welcome, Paul")
    end
end

feature 'User signs up to service' do

  before(:each) do
      User.create(:name => "Paul",
                  :password => "paul",
                  :password_confirmation => "paul",
                  :username => "paulychops",
                  :email => 'paul@example.com')
      end

  scenario 'users email address is stored' do
    sign_in('paul@example.com', 'paul')
    expect(User.first.email).to eq("paul@example.com")
  end

  scenario "return a message if email is already taken" do
    sign_up
    sign_up
    expect(page).to have_content "This email is already taken"
  end

end


  def sign_in(email, password)
      visit('/sessions/new')
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      click_button 'Sign in'
  end


  def sign_up(name = "Paul",
              password ="paul",
              password_confirmation = "paul",
              username = "paulychops",
              email = "paul@example.com")
    visit('/users/new')
    expect(page.status_code).to eq(200)
    fill_in :name, :with => name
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    fill_in :username, :with => username
    fill_in :email, :with => email
    click_button "Sign up"
  end
