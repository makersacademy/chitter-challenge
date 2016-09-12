require 'spec_helper'

feature 'sign up' do

  scenario 'a user can sign up with valid details' do
    sign_up(email: 'test@test.com',
            name: 'Test User',
            username: 'test93',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(1)
    expect(page).to have_current_path("/peeps")
  end

  scenario 'a user can not sign up without matching passwords' do
    sign_up(email: 'test@test.com',
            name: 'Test User',
            username: 'test93',
            password: 'password1',
            password_confirmation: 'asdfkljsad;l')

    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
  end

  scenario 'a user can not sign up with an invalid email' do
    sign_up(email: 'test.com',
            name: 'Test User',
            username: 'test93',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
  end

  scenario 'a user can not sign up with the same username as another user' do
    sign_up(email: 'test@test.com',
            name: 'Test User',
            username: 'test93',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(1)

    sign_up(email: 'test2@test.com',
            name: 'Test User',
            username: 'test93',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(1)
    expect(page).to have_current_path("/sign_up")
  end

  scenario 'a user can not sign up without a username' do
    sign_up(email: 'test@test.com',
            name: 'Test User',
            username: '',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
  end

  scenario 'a user can not sign up without an email' do
    sign_up(email: '',
            name: 'Test User',
            username: 'test93',
            password: 'password1',
            password_confirmation: 'password1')

    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
  end

  scenario 'a user can not sign up without a password' do
    sign_up(email: 'test@test.com',
            name: 'Test User',
            username: 'test93',
            password: '',
            password_confirmation: '')

    expect(User.count).to eq(0)
    expect(page).to have_current_path("/sign_up")
  end

end
