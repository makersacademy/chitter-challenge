# frozen_string_literal: true

require 'user'

feature 'logging in' do
  let(:email) { 'test@example.com' }
  let(:password) { 'password123' }

  before(:each) do
    User.create(email, password)
    visit('/chitter')
    click_button 'log-in'
  end

  scenario 'user can log in' do
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'submit'

    expect(page).to have_content "Welcome, #{email}"
  end

  scenario 'a user sees an error if they get their email wrong' do
    fill_in 'email', with: 'wrong email'
    fill_in 'password', with: password
    click_button 'submit'

    expect(page).not_to have_content "Welcome, #{email}"
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    fill_in(:email, with: email)
    fill_in(:password, with: 'wrongpassword')
    click_button 'submit'

    expect(page).not_to have_content "Welcome, #{email}"
    expect(page).to have_content 'Please check your email or password.'
  end
end
