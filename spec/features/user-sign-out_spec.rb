require_relative '../spec_helper'

feature 'sign out' do

  scenario 'user signs out' do
    register
    click_button 'Sign out'
    expect(page).to have_content 'You have successfully signed out'
  end

end
