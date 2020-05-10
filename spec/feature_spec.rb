require 'pg'
require 'spec_helper'
require_relative 'feature_methods'

feature 'Maker can view list of peeps' do
  scenario 'homepage shows list of peeps in chronological order' do
    MakerPeep.create(peep: "Hey!", username: "Laura", datetime: "09/05/2020")
    MakerPeep.all
    visit('/')
    expect(page).to have_content("Hey!")
  end
end

feature 'Asks user to sign_up' do
  scenario 'requests user to click on sign_up button' do
    MakerPeep.all
    visit ('/')
    click_button('Sign Up')
    expect(page).to have_content('Sign Up!')
  end
end

feature 'Asks user to login' do
  scenario 'requests user to click on sign_up button' do
    MakerPeep.all
    visit ('/')
    click_button('login')
    expect(page).to have_content('Login!')
  end
end

feature 'Fill in sign-in details' do
  scenario 'request the user fills in sign-in details' do
    MakerPeep.create(peep: "Hey!", username: "Laura", datetime: "09/05/2020")
    MakerPeep.all
    visit ('/')
    click_button('Sign Up')
    fill_in("name", with: 'Sally')
    fill_in('username', with: 'Sally94')
    fill_in('email', with: 'sal@gmail.com')
    fill_in('password', with: 'Sally94')
    click_button('Sign Up')
    # @maker.signup(username: 'Sally94', name: "Sally", email: 'sal@gmail.com', password: 'Sally94')
    expect(page).to have_content('Your Profile!')
  end
end

# feature 'Check profile details and return to login' do
#   scenario 'check user details then click login button to return to login' do
#     signin_process
#     click_button "Log In"
#     expect(page).to have_content("Login!")
#   end
# end

feature 'Enter login details' do
  scenario 'Ask the user to fill in login details and send back to home page' do
    MakerPeep.create(peep: "Hey!", username: "Laura", datetime: "09/05/2020")
    MakerPeep.all
    visit ('/')
    click_button('login')
    click_button('Login')
    expect(page).to have_content("Hey!")
  end
end

feature 'User adds peep' do
  scenario 'User adds peep, which is then made visible on the home page' do
    MakerPeep.create(peep: "Hey!", username: "Laura", datetime: "09/05/2020")
    MakerPeep.all
    visit ('/')
    click_button('login')
    click_button('Login')
    expect(page).to redirect_to '/home'
    click_button('Add Peep!')
    fill_in('peep', with: 'Oh Happy Days!')
    fill_in('username', with: 'Sally94')
    click_button('Add Peep!')
    expect(current_path).to eq '/add_peep'
    expect(page).to have_content('Oh Happy Days!')
  end
end

#
#
#
# profile = double :makerprofile("Laura", "Laura26", "l@gmail", "howdy"),
# signup("Laura", "Laura26", "l@gmail", "howdy"):
# connection = PG.connect(dbname: 'chitter_test')
# result = connection.exec("INSERT INTO profile (username, name, email, password) VALUES ('Laura', 'Laura26', 'l@gmail', 'howdy')
# RETURNING username, name, email, password, id;")
