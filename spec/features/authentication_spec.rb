require_relative 'web_helpers'

feature 'authentication' do
  scenario 'a user can sign in' do
    sign_in
    expect(page).to have_content 'Welcome, test@example.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_in_with_wrong_email
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they get their password wrong' do
    sign_in_with_wrong_password
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    sign_in
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please Sign up or Sign in'
  end
end
