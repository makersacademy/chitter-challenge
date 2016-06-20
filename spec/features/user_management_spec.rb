require './spec/web_helper'

feature 'Signing up' do
  scenario 'user signs up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome marlon')
    expect(User.first.username).to eq('marlon')
  end
end

feature 'Reasons why signing in fails' do
  scenario 'password and confirmation do not match' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'I cannot sign up without an email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an incorrectly formatted email address' do
    expect{ sign_up(email: 'happy') }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without an name' do
    expect{ sign_up(name: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without an username' do
    expect{ sign_up(username: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with a username that is already taken' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'I cannot sign up with a email that is already taken' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
