require 'spec_helper'

feature 'Saving peeps' do

  scenario 'User can post a peep to the website' do
    post_peep
    expect(page).to have_content(:message)
  end

end
