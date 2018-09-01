feature 'Features - Chitter' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario 'user send a peep to chitter' do
    visit('/')
    click_button 'Send a peep'
    fill_in :send_peep, with: 'my first peep, hurray!'
    click_button 'Submit'
  end
  
end
