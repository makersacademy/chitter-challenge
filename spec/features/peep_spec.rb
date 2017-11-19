require './app/app.rb'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

feature 'peep' do
  scenario 'posting a peep' do
    visit('/signin')
    fill_in('email', with: 'marco@gmail.com')
    fill_in('password', with: '12345')
    click_on('Sign in')
    fill_in('message', with: 'A cool message to take a lot of likes')
    click_on('Post')
    expect(page).to have_content "#{Time.new} A cool message to take a lot of likes"
    DatabaseCleaner.clean
  end
  scenario 'posts in reverse chonological order' do
    visit('/signin')
    fill_in('email', with: 'marco@gmail.com')
    fill_in('password', with: '12345')
    click_on('Sign in')
    fill_in('message', with: 'A cool message to take a lot of likes 1')
    click_on('Post')
    visit('/newpeep')
    fill_in('message', with: 'A cool message to take a lot of likes 2')
    click_on('Post')
    expect(page).to have_content "#{Time.new} A cool message to take a lot of likes 2 \n #{Time.new} A cool message to take a lot of likes 1"
    DatabaseCleaner.clean
  end
end
