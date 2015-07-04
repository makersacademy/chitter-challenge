require './spec/factory/user.rb'

feature 'Visitor signs up' do

  before(:each) do
    visit '/users/new'
  end

  scenario 'with valid email and password' do
    valid_user = build :user

    sign_up_with valid_user

    expect(page).to have_content 'Welcome, me@example.com'
  end

  scenario 'with valid email and invalid password' do
    invalid_user = build :user, password_confirmation: 'wrong'

    sign_up_with invalid_user

    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'with blank fields' do
  end
end

def sign_up_with user
  fill_in 'email',                  with: user.email
  fill_in 'password',               with: user.password
  fill_in 'password_confirmation',  with: user.password_confirmation

  click_button 'Sign up'
end
