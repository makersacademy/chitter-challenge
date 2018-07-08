require './chitter_app.rb'

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Viewing messages on Chitter' do
  scenario 'a user can view all messages by reverse chronological order' do
    visit('/messages/new')
    fill_in('message', with: 'This is a test message 1')
    click_button('Add message')
    visit('/messages/new')
    fill_in('message', with: 'This is a test message 2')
    click_button('Add message')

    expect(current_path).to eq '/messages'
    expect(page).to have_content 'This is a test message 2'
    expect(page).to have_content 'This is a test message 1'
  end
end
