def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'Vicky ledsom'
  fill_in :username, with: 'ledleds'
  fill_in :email, with: 'vicky@makers.co.uk'
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '1234'
  click_button 'Create account'
end

def incorrect_sign_up_password
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'Vicky ledsom'
  fill_in :username, with: 'ledleds'
  fill_in :email, with: 'vicky@makers.co.uk'
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '12'
  click_button 'Create account'
end
