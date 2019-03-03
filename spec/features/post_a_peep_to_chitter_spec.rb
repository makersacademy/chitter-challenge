require 'spec_helper'

feature 'adding a peep' do
  scenario 'A user can add a peep' do
    visit '/peeps/new'
    fill_in('text', with: "First peep text test")
    click_button('Submit')

    expect(page).to have_content "First peep text test"
  end
end
