# frozen_string_literal: true

require 'user'

feature 'logging in' do
  let(:email) { 'test@example.com' }
  let(:password) { 'password123' }

  scenario 'user can log in' do
    User.create(email, password)

    visit('/chitter')
    click_button 'log-in'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'submit'

    expect(page).to have_content "Welcome, #{email}"
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email, password)

    visit('/chitter')
    click_button 'log-in'
    fill_in 'email', with: 'wrong email'
    fill_in 'password', with: password
    click_button 'submit'

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
end
