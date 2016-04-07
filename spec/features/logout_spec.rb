require_relative 'web_helper'

feature 'user can sign out' do
  scenario 'user no longer signed in' do
    sign_up
    click_button 'Create account'
    sign_out
    expect(page).to have_content "Come back soon"
    expect(page).not_to have_content "Welcome, TestUser1"
    expect(current_path).to eq('/peeps')
  end
end
