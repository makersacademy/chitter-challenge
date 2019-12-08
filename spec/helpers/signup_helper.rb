def sign_up name, email
  visit '/'

  click_on 'Sign up'

  fill_in 'user_name', with: name
  fill_in 'user_email', with: email
  click_button 'Sign up'
end
