require 'spec_helper'

feature 'creating peeps' do

  scenario 'I can not peep when not logged in' do

    visit '/peeps'
    expect(page).not_to have_content('enter peep')
    expect(page).to have_content('you must be logged in to peep')
  end

  scenario ' I can peep when logged in' do

    user = create(:user)
    sign_in_as(user)
    visit '/peeps'
    expect(page).not_to have_content('you must be logged in to peep')
    fill_in 'peep_body', with: 'this is a peep'
    click_button 'Create peep'
    within 'ul#peeps' do
      expect(page). to have_content ('this is a peep')
    end
  end
end