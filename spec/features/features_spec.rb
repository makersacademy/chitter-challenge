feature 'Features - Chitter' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario 'user send a peep to chitter' do
    visit('/')
    click_button 'Send a peep'
    fill_in :peep, with: 'my first peep, hurray!'
    click_button 'Submit'
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'user want to see all peeps' do
    visit('/all_peeps')
    expect(page).to have_content('my first peep, hurray!')
  end

end
