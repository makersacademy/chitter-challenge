require './chitter_app.rb'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Creating a new message to Chitter' do
  scenario 'a user can create a message' do
    visit('/messages/new')
    fill_in('message', with: 'This is a test message')
    click_button('Add message')

    expect(current_path).to eq '/messages'
    expect(page).to have_content 'This is a test message'
  end
end
