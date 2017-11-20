require './app/app.rb'
require 'database_cleaner'
require './spec/features/feature_helper.rb'

DatabaseCleaner.strategy = :truncation

feature 'sign in' do
  scenario 'signing in' do
    visit('/signin')
    fill_in('email', with: 'marco@gmail.com')
    fill_in('password', with: '12345')
    click_on('Sign in')
    fill_in('message', with: 'A cool message to take a lot of likes')
    click_on('Post')
    expect(page).to have_content("marco@gmail.com \n #{Time.new} \n A cool message to take a lot of likes")
    DatabaseCleaner.clean
  end
end
