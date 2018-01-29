def sign_up
  fill_in 'email', with: 'f@ke.email'
  fill_in 'username', with: 'EllieWem'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Sign up'
end

def sign_up_wrong_password
  fill_in 'email', with: 'f@ke.email'
  fill_in 'username', with: 'EllieWem'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'wrongpassword'
  click_button 'Sign up'
end

def sign_in
  visit '/sessions/sign_in'
  fill_in 'username', with: 'test'
  fill_in 'password', with: 'testing'
  click_button 'Sign in'
end

def create_test_user
  User.create(email: 'test@test.com', username: 'test', password: 'testing', password_confirmation: 'testing')
end
