require './spec/factory/user'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    visit '/users/new'
    valid_user = build :user

    sign_up_with valid_user

    expect(page).to have_content 'Welcome, me@example.com'
  end
end

def sign_up_with opts={}
  fill_in 'email',                  with: :email
  fill_in 'password',               with: :password
  fill_in 'password_confirmation',  with: :password_confirmation

  click_button 'Sign up'
end
