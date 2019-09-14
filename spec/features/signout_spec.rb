require_relative 'web_helpers'

feature 'Sign out' do
  scenario 'a user can sign out' do
    log_in_test
    expect(page).to have_content "Chitter - Get your Daily Peeps"
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have been signed out.'
  end
end
