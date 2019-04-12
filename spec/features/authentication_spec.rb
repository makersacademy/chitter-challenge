require_relative 'web_helper'

feature 'authentication' do
  it 'a user can sign in' do
    sign_up

    expect(page).to have_content 'Welcome, Test'
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_up

    click_button 'Sign Out'

    click_button 'Sign In'
    fill_in(:email, with: 'wrongemail@example.com')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    sign_up

    click_button 'Sign Out'

    visit '/'
    click_button 'Sign In'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    sign_up

    click_button 'Sign Out'

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'You have signed out.'
  end

  scenario "a user can't sign up with an email thats already being used" do
    sign_up
    expect(page).to have_content 'Welcome, Test'
    click_button 'Sign Out'

    click_button 'Sign Up'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    fill_in(:name, with: 'Test')
    fill_in(:username, with: 'Tester2')
    click_button 'Sign up'
    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'This email address is already in use.'
  end

  scenario "a user can't sign up with a username thats already being used" do
    sign_up
    expect(page).to have_content 'Welcome, Test'
    click_button 'Sign Out'

    click_button 'Sign Up'
    fill_in(:email, with: 'newtest@example.com')
    fill_in(:password, with: 'password123')
    fill_in(:name, with: 'Test')
    fill_in(:username, with: 'Tester')
    click_button 'Sign up'

    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'This username is not available.'
  end
end
