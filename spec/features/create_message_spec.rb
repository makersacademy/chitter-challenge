require './chitter_app.rb'

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Creating a new message to Chitter' do
  scenario 'a user can create a message' do
    visit('/messages/new')
    fill_in('message', with: 'This is a test message')
    click_button('Add message')

    expect(current_path).to eq '/messages'
    expect(page).to have_content 'This is a test message'
  end
end
