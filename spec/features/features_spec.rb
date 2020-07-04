require './spec/clear_test_database.rb'

feature 'Users can post messages' do

  scenario 'User can enter a message and see it disaplayed on the screen' do
    visit('/')
    fill_in :message, with: 'Hello Chitter!'
    click_button 'Submit'
    expect(page).to have_content('Hello Chitter!')
  end

  scenario 'User can see their own name when they post a message' do
    visit('/')
    fill_in :message, with: 'Hello Chitter!'
    fill_in :user, with: 'James'
    click_button 'Submit'
    expect(page).to have_content('Hello Chitter!')
    expect(page).to have_content('James')
  end
end