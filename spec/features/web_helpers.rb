def fill_in_registration
  click_button('Register!')
  fill_in('add_email', with: 'test@email.com')
  fill_in('add_password', with: 'password')
end

def fill_in_login
  fill_in('user_email', with: 'test@email.com')
  fill_in('user_password', with: 'password')
end
