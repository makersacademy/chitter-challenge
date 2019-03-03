require 'spec_helper'
require 'web_helper'

feature 'authentication' do
  scenario 'a user can log in' do
    create_user
    log_in

    expect(page).to have_content 'Welcome, Simona'
  end

  scenario 'a user sees an error if they get their email wrong' do
    create_user
    log_in_with_wrong_email

    expect(page).not_to have_content 'Welcome, Simona'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    create_user
    log_in_with_wrong_password

    expect(page).not_to have_content 'Welcome, Simona'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can log out' do
    create_user
    log_in

    expect(current_path).to eq '/peeps'

    click_button('Log Out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end
