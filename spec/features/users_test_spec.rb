# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'can access the sign up page from the home page' do
    visit '/'
    click_button "Sign up"
    expect(page).to have_current_path '/chitter/sign_up'
  end

  scenario 'can add user details to the users table' do
    visit '/'
    click_button "Sign up"
    fill_in "username", with: "Someone233"
    fill_in "password", with: "abcd1234"
    fill_in "email", with: "someone233@hotmail.com"
    fill_in "forename", with: "Someone"
    fill_in "surname", with: "Somebody"
    click_button "Submit"
    expect(page).to have_current_path '/chitter/sign_up'
    expect(page).to have_content 'Success, welcome to Chitter Someone'
  end

  scenario 'User will receive an error message if username is taken' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    click_button "Sign up"
    sign_up
    expect(page).to have_current_path '/chitter/sign_up'
    expect(page).to have_content 'Sorry, that username is already taken. Please try again'
  end
end

feature 'Login' do

  before 'test' do
    visit '/'
    click_button "Sign up"
    sign_up
    find('#panel').click
    click_link 'Log out'
  end

  scenario 'incorrect credentials results in error message' do
    visit '/'
    find('#panel').click
    click_link 'Login'
    fill_in "username", with: "Someone233"
    fill_in "password", with: "wrongPassword"
    click_button "Submit"
    expect(page).to have_content("Username or password was incorrect or you have not signed up")
    expect(page).to have_current_path '/sessions/new'
  end

  scenario 'correct credentials results in success message and redirect' do
    visit '/'
    find('#panel').click
    click_link 'Login'
    fill_in "username", with: "Someone233"
    fill_in "password", with: "abcd1234"
    click_button "Submit"
    expect(page).to have_content("Welcome back Someone!!")
    expect(page).to have_current_path '/chitter/feed'
  end
end

feature 'logout' do

  before 'test' do
    visit '/'
    click_button "Sign up"
    sign_up
    find('#panel').click
    click_link 'Log out'
  end

  scenario "it can end a user's session" do
    login
    find('#panel').click
    click_link 'Log out'
    expect(page).to have_content("You have signed out")
    expect(page).to have_current_path '/chitter'
  end
end
