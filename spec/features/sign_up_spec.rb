require 'spec_helper'

feature 'sign up form' do
  scenario 'users can sign up' do
    sign_up
    expect(page).to have_content('Elizabeth')
    expect(User.first.name).to eq('Elizabeth')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'User not signed up without an email address' do
    expect {sign_up(email: nil).not_to change(User, :count)}
  end

  scenario 'User not signed up without a name' do
    expect {sign_up(name: nil).not_to change(User, :count)}
  end

  scenario 'User not signed up without a username' do
    expect {sign_up(username: nil).not_to change(User, :count)}
  end

  scenario 'User not signed up with invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

end
