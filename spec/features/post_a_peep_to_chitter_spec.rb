require 'spec_helper'

feature 'adding a peep' do
  scenario 'A user can add a peep' do
    sign_up
    post_a_peep

    expect(page).to have_content "First peep text test"
  end
end
