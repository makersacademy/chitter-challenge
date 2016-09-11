def sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end

def invalid_email_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:email, with: 'test')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end

def no_email_sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('sign up')
end
