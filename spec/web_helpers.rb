def signup_simon
  visit '/'
  fill_in('sign_up_name', with: 'Simon')
  fill_in('sign_up_username', with: 'SY')
  fill_in('sign_up_email', with: 'email@example.com')
  fill_in('sign_up_password', with: 'password123')

  click_button('sign up')
end

def login_simon
  visit '/'
  fill_in('sign_up_name', with: 'Simon')
  fill_in('sign_up_username', with: 'SY')
  fill_in('sign_up_email', with: 'email@example.com')
  fill_in('sign_up_password', with: 'password123')

  click_button('sign up')

  fill_in('email', with: 'email@example.com')
  fill_in('password', with: 'password123')
  click_button('login')
end
