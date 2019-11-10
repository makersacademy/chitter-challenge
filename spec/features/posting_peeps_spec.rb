require 'spec_helper'
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature '1. Posting Peeps' do
  scenario 'User can post a peep' do
    visit '/peeps/new'
    fill_in "text", with: "This is a new peep"
    click_button('Create Peep')
    expect(page).to have_content "This is a new peep"
  end
end
