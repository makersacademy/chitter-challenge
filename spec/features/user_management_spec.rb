require 'spec_helper'


feature 'User signs out' do

  before(:each) do
    User.create(:username => 'test',
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'while being signed in' do
    sign_in('test', 'password')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, test@test.com")
  end


  #This needs to be extrated into a helper file
  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Sign in!'
  end

end



feature "User signs in" do

  before(:each) do
    User.create(:password => 'password',
                :password_confirmation => 'password',
                :username => 'test')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Hi test")
    sign_in('test', 'password')
    expect(page).to have_content("Hi test")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Hi test")
    sign_in('test', 'wrong')
    expect(page).not_to have_content("Hi")
  end

  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Sign in!'
  end

end

feature "User signs up" do

  scenario "when a new user visits the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Hi GabeMaker!")
    expect(User.first.username).to eq("GabeMaker")
  end

  def sign_up(username = "GabeMaker",
              password = "testcoderepeat",
              password_confirmation = "testcoderepeat",
              name = "Gabe",
              email = "Gabe@gabe.com"
              )
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :username, :with => username
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    fill_in :name, :with => name
    fill_in :email, :with => email

    click_button "Sign up!"
  end

  scenario "when a password doesn't match" do
    expect{ sign_up('Test', 'Right', 'Wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Your passwords don't match")
  end

  scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  scenario "with a username that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This username is already taken")
  end

end