require 'spec_helper'

feature 'Signing out' do

  scenario 'while being signed in' do
    user = create(:user)
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye')
  end

end
