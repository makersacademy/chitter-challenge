def sign_up
  visit('/users/new')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  fill_in 'confirm_password', :with => "password"
  click_button('sign-up')
end

def invalid_email_sign_up
  visit('/users/new')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "a!@1"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  click_button('sign-up')
end

def no_password_sign_up
  visit('/users/new')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  click_button('sign-up')
end

def wrong_password_confirmation
  visit('/users/new')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  fill_in 'confirm_password', :with => "psswrd"
  click_button('sign-up')
end

def correct_log_in
  visit("/sessions/new")
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'password', :with => "password"
  click_button('log-in')
end

def incorrect_log_in
  # visit('log_in')
  visit('/sessions/new')
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'password', :with => "pass"
  click_button('log-in')
end

def post_peep
  fill_in 'user_message', :with => peep
  click_button('peep')
end

def post_two_peeps
  fill_in 'user_message', :with => peep
  click_button('peep')
  fill_in 'user_message', :with => peep2
  click_button('peep')
end

def recover_password
  visit "/users/recover_password"
  fill_in 'email', with: 'samuel@gmail.com'
  click_button 'reset password'
end

def reset_password
  visit("/users/enter_token/#{user.password_token}")
  fill_in 'password', :with => "newpassword"
  fill_in 'password_confirmation', :with => "newpassword"
  click_button 'submit'
end
