require 'spec_helper'

feature 'User sign up' do

  let(:user){build :user}

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: user.name
    fill_in :handle,    with: user.handle
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  scenario 'I can sign up as a new user' do
    expect {sign_up(user)}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.name}")
    expect(User.first.email).to eq("#{user.email}")
  end

  scenario 'requires a matching confirmation password' do
     user = create(:user, password_confirmation: 'wrong')
     expect {sign_up(user)}.not_to change(User, :count)
     expect(current_path).to eq('/users')
     expect(page).to have_content 'Password does not match the confirmation'
   end

  scenario 'without an email address' do
    user = create(:user, email: nil)
    expect {sign_up(user)}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up(user)
    expect {sign_up(user)}.to change(User, :count).by(0)
    expect(page).to have_content 'Email is already taken'
  end

end

feature 'User sign in' do

  let(:user){create :user}

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

end
