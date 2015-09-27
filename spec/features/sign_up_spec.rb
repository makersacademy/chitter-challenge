require 'spec_helper'

feature 'Sign Up' do
  let(:user) {build(:user)}

  before do
    visit '/'
    click_button 'Register'
  end

  scenario 'as a new user' do
    expect {sign_up(user)}.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, #{user.username}"
    expect(User.first.email).to eq 'dan@example.com'
  end

  scenario 'requires user to have username' do
    user.username = nil
    expect {sign_up(user)}.to change(User, :count).by(0)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'requires an email' do
    user.email = nil
    expect {sign_up(user)}.to change(User, :count).by(0)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'requires a matching confirmation password' do
    user.password_confirmation = 'wrong!'
    expect {sign_up(user)}.to change(User, :count).by(0)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'denied if email is already registered' do
    user2 = create :user
    expect {sign_up(user2)}.to change(User, :count).by(0)
    expect(page).to have_content 'Email is already taken'
  end
end
