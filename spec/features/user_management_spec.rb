require 'spec_helper'

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, Costas"
    expect(User.first.username).to eq "Costas"
    expect(User.first.email).to eq "example@example.com"
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "with an email or username that is already registered" do
    expect{ sign_up }.to change(User, :count).by 1
    expect{ sign_up }.to change(User, :count).by 0
    expect(page).to have_content "This email is already taken"
    expect(page).to have_content "This username is already taken"
  end

feature "User signs in" do

  before(:each) do
    User.create(:username => "test",
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Welcome, test")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test")
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content("Welcome, test")
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign In'
  end
end

  def sign_up(username = "Costas",
              email = "example@example.com",
              password = "12345",
              password_confirmation = "12345")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign Up"
  end

end