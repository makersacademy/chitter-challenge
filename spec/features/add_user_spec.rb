require './spec/spec_helper'
require './spec/web_helper'

feature 'User sign up' do
  scenario 'User can visit sign up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    find_field('Email').value
    find_field('Password').value
    expect(page).to have_button('Sign up')
  end

  scenario 'New user is created' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@email.com')
    expect(User.first.email).to eq('user@email.com')
  end

  scenario 'Fail password confirmation' do
    expect{ sign_up(password_confirmation: 'WrongPW') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'Cannot sign up without email' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'Cannot sign up with invalid email' do
    expect{ sign_up(email: "bob") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Cannot sign up with existing email' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end
end

feature 'User sign in' do
  let!(:user) do
    User.create(email: 'user@example.com', password: '1234', password_confirmation: '1234')
  end

  scenario 'User can sign in with the correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'User cannot sign in with the wrong password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end

feature 'User sign out' do
  let!(:user) do
    User.create(email: 'user@example.com', password: '1234', password_confirmation: '1234')
  end

  scenario 'User can sign out' do
    sign_in(email: user.email, password: user.password)
    click_button('Sign out')
    expect(current_path).to eq('/links')
    expect(page).to have_content "Goodbye"
  end

end
