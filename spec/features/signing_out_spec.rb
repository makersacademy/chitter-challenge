require 'spec_helper'

feature 'Sign out' do
  scenario 'while being signed in' do
    user = create(:user)
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('See you again soon!')
    expect(page).not_to have_content("Signed in as #{user.username}")
  end
end