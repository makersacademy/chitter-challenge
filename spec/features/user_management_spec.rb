require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(current_path).to eq('/')
    expect(page).to have_content "Welcome to Chitter, Joe Zhou @joema!"
    expect(User.first.email).to eq "joe@ma.com"
  end

  scenario 'requires a non-empty username to sign up' do
    user = build(:user, username: nil)
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'requires a non-empty email to sign up' do
    user = build(:user, email: nil)
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'requires a non-empty name' do
    user = build(:user, name: nil)
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Name must not be blank'
  end

  scenario 'requires password confirmation to match password' do
    user = build(:user, password_confirmation: 'not_right')
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up if username already exists' do
    user = create :user
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'cannot sign up if email already exists' do
    user = create :user
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'two person of the same name can signup as two users' do
    user = create :user
    sign_up(user)
    user.username = 'joezhou'
    user.email = 'jz@jz.com'
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(current_path).to eq('/')
    expect(page).to have_content "Welcome to Chitter, Joe Zhou @joezhou!"
  end

  scenario 'displays multiple error messages' do
    user = create :user
    user.email = nil
    user.name = nil
    user.password_confirmation = 'wrong'
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Username is already taken'
    expect(page).to have_content 'Password does not match the confirmation'
    expect(page).to have_content 'Email must not be blank'
    expect(page).to have_content 'Name must not be blank'
  end

end

feature 'User sign in' do

  scenario 'I can sign in with my username and password' do
    user = create :user
    sign_in(user)
    expect(current_path).to eq('/')
    expect(page).to have_content "Welcome to Chitter, Joe Zhou @joema!"
  end

  scenario 'Display error message when signing in with wrong username' do
    user = create :user
    user.username = 'wrong'
    sign_in(user)
    expect(current_path).to eq('/')
    expect(page).to have_content "The email or password is incorrect"
  end

end
