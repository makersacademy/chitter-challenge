def sign_up
  visit('/sign_up')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  fill_in 'confirm_password', :with => "password"
  click_button('sign-up')
end

def invalid_email_sign_up
  visit('/sign_up')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "a!@1"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  click_button('sign-up')
end

def no_password_sign_up
  visit('/sign_up')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  click_button('sign-up')
end

def wrong_password_confirmation
  visit('/sign_up')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  fill_in 'confirm_password', :with => "psswrd"
  click_button('sign-up')
end

def correct_log_in
  visit("/log_in")
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'password', :with => "password"
  click_button('log-in')
end

def incorrect_log_in
  visit('log_in')
  visit("/log_in")
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'password', :with => "pass"
  click_button('log-in')
end
