feature 'Sign up' do
  scenario 'a user can sign up' do
    log_in_test
    expect(page).to have_content "Chitter - Get your Daily Peeps"
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have been signed out.'
  end

  scenario 'handle/username must be unique' do
    create_new_user
    expect(page).to have_content "Email/Handle already in use, try again"
  end
end
