require 'spec_helper'

feature "User signs up and" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Chitter Welcome, riz")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('riz', 'riz', 'a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your password don't match")
  end

  scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  def sign_up(name = "riz",
              user_name = "riz",
              email = "alice@example.com",
              password = "oranges!",
              password_confirmation = "oranges!")
  visit '/users/new'
  fill_in :name, :with => name
  fill_in :user_name, :with => user_name
  fill_in :email, :with => email
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button "Sign up"
  end
end

feature "User signs in" do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :user_name => 'riz',
                :name => 'Rizwan',
                :password_confirmation => 'test')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Chitter Welcome, Rizwan")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Chitter Welcome, Rizwan")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Chitter Welcome, Rizwan")
    sign_in('test@test.com', 'wrong')

  #   expect(page).not_to have_content("Welcome, test@test.com")
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, test@test.com")
  end
end


def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
end


  def sign_out
  click_button "Sign out"
end



