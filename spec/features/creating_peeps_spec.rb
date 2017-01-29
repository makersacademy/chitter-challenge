require 'spec_helper'

feature 'Saving peeps' do

  scenario 'User can post a peep to the website' do
    post_peep
    expect(page).to have_content(:message)
  end

  scenario 'User\'s username gets saved when creating peep' do
    post_peep
    expect(page).to have_content(:username)
  end

  scenario 'Peep\'s time gets saved when creating peep' do
    post_peep
    expect(page).to have_content(:created_at)
  end

end
