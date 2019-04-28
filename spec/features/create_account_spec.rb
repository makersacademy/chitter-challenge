require_relative 'test_helper'

feature 'accounts can be created' do
  scenario 'user creates a new account' do
    create_account
    expect(page).to have_content "Thank you for creating your new account, Hannah!"
  end
  scenario 'raises issue if user is not signed in' do
    visit '/home'
    expect(page).to have_content "You must sign in or create an account first."
  end
end
