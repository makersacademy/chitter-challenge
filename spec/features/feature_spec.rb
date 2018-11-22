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
