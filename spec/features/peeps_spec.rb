require 'spec_helper'

feature 'Posting peeps' do

  scenario 'Posted peeps are visible on the main site' do
    signup_testuser1
    click_button 'Sign up'
    add_peep
    expect { click_button 'Peep'}.to change(Peeps, :count).by 1
    expect(page).to have_content 'This is a testing peep '
  end

  scenario 'Peeps cannot be anonymous' do
    add_peep
    expect { click_button 'Peep'}.to change(Peeps, :count).by 0
    expect(page).to have_content 'Please sign in to peep'
  end

end
