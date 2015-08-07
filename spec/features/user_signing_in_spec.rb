require './spec/factory/user.rb'

feature 'Visitor signs up' do

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

  xscenario 'with blank fields' do

  end

  scenario 'with invalid email address (duplicate)' do
    first_user  = create :user
    second_user = build :user

    sign_up_with second_user

    expect(User.count).to eq 1
    expect(page).to have_content 'Email is already taken'
  end
end

def sign_up_with user
  visit '/users/new'
  
  fill_in 'email',                  with: user.email
  fill_in 'password',               with: user.password
  fill_in 'password_confirmation',  with: user.password_confirmation

  click_button 'Sign up'
end
