require_relative '../factories/user'
require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, foo@bar.com')
    expect(User.first.email).to eq('foo@bar.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build :user
    user.password_confirmation = 'wrong'
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    user = build :user
    user.password_confirmation = 'wrong'
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Please refer to the errors listed below:'
  end

  scenario 'with an empty name field' do
    user = build :user
    user.name = nil
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'with an empty username field' do
    user = build :user
    user.username = nil
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'with an empty email field' do
    user = build :user
    user.email = nil
    expect { sign_up_as(user) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    user = build :user
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    user = build :user
    sign_up_as(user)
    expect { sign_up_as(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

end

feature 'User sign in' do

  # let(:user) do
  #   User.create(name: 'Test Test',
  #               username: 'testtest',
  #               email: 'test@test.com',
  #               password: 'test',
  #               password_confirmation: 'test')
  # end

  scenario 'with correct credentials' do
    user = build :user
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end

feature 'User signs out' do

  # let(:user) do
  #   User.create(name: 'Test Test',
  #               username: 'testtest',
  #               email: 'test@test.com',
  #               password: 'test',
  #               password_confirmation: 'test')
  # end

  scenario 'while being signed in' do
    user = build :user
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end

# feature 'password reset' do
#
#   scenario 'requesting a password reset' do
#     user = User.create(email: 'test@test.com',
#                       password: 'secret1234',
#                       password_confirmation: 'secret1234')
#     visit '/password_reset'
#     fill_in 'Email', with: user.email
#     click_button 'Reset password'
#     user = User.first(email: user.email)
#     expect(user.password_token).not_to be_nil
#     expect(page).to have_content 'Check your emails'
#   end
#
# end
