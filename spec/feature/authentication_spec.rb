require_relative "../test_helpers"

feature 'authentication' do

  before(:each) do
    create_test_user
  end

  scenario 'a user can log in' do
    sign_in_as_test_user
    expect(page).to have_content 'Welcome, test@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_in_with_different_email
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    sign_in_with_different_password
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can log out' do
    sign_in_as_test_user
    log_out
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end