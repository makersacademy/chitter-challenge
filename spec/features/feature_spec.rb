require 'spec_helper.rb'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post message (peep) to chitter' do
  scenario 'allows to post a message to Chitter' do
    visit '/chitter'
    expect(page).to have_content "Enter your message"
  end
end
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'Show all peeps in reverse chronological order' do
  scenario 'peeps are displayed in order on /chitter page' do
    visit '/chitter'
    fill_in :content, with: 'My first message'
    click_button 'Submit'
    fill_in :content, with: 'My second message'
    click_button 'Submit'
    expect(page.find('li:nth-child(1)')).to have_content('My first message')
    expect(page.find('li:nth-child(2)')).to have_content('My second message')
  end

end
