require 'spec_helper'

feature 'users can post peeps' do


  scenario 'logged in user posts a peep' do
    post_peep
    expect(page).to have_content "Got such cheese munchies"
  end
end
