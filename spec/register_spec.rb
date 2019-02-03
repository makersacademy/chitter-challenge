require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/app.rb'
require 'sinatra'

feature 'expecting there to be username input fields' do
  scenario 'is the username field there?' do
  visit('/register')
  expect(page).to have_content('username')
  end
  end

feature 'expecting there to be a email field' do
  scenario 'is there a email field?' do
    visit ('/register')
    expect(page).to have_content('email')
  end
end


feature 'inputting data into registration' do
  scenario 'a user can register for the website' do
    visit('/register')
    fill_in('email', with: 'test_email@test.com')
    fill_in('password', with: '12345')
    fill_in('username', with: 'rawr')
    fill_in('name', with: 'testing')
    click_button('Submit')
  end
end
