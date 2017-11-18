require 'capybara/rspec'
require './models/peep.rb'
feature 'Posting peeps' do
  scenario 'I want to be able to write and post a message to the chitter page' do
    visit '/'
    click_button 'Sign in!'
    fill_in 'new_peep', with: 'I love chocolate'
    click_button 'Post!'
    expect(page).to have_content 'I love chocolate'
  end
end
