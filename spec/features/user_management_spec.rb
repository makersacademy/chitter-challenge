require 'spec_helper'

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Chris")
    expect(User.first.email).to eq("chris@hello.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

   scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  def sign_up(username = "Chris",
              email = "chris@hello.com",
              password = "password",
              password_confirmation = "password")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end

feature "User signs in" do

  before(:each) do
    User.create(:username => "Chris",
                :email => "chris@chris.com",
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, Chris")
    sign_in('chris@chris.com', 'password')
    expect(page).to have_content("Welcome, Chris")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, Chris")
    sign_in('chris@chris.com', 'wrong')
    expect(page).not_to have_content("Welcome, Chris")
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

end