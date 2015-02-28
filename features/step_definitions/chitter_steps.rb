require './app/server'

ENV['RACK_ENV'] = 'test'

Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I click on Sign up$/) do
  click_link('Signup')
end

Then(/^I can enter "(.*?)", "(.*?)", "(.*?)" and "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  expect(page).to have_content(arg1)
  expect(page).to have_content(arg2)
  expect(page).to have_content(arg3)
  expect(page).to have_content(arg4)
end

Then(/^I can see "(.*?)"$/) do |arg1|
  sign_up
  save_and_open_page
  expect{ sign_up }.to change(User, :count).by(1)
  expect(User.first.email).to eq("thomas@strothjohann.net")
  expect(page).to have_content("Welcome, TStrothjohann!")
end


  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

  def sign_up(username = "TStrothjohann", name = "Thomas1", 
    email = "thomas@strothjohann.net", password = "test", 
    password_confirmation = 'test')
    visit '/users/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    #click_button "signup"
  end