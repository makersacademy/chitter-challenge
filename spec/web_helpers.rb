def sign_up(user_name: 'atulord', email: 'a@bc.edu',
            password: '1234', password_confirmation: '1234')
  visit '/'
  click_button 'Sign up'
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Register'
end

def sign_in(username, password)
    visit '/sessions'
    fill_in :user_name, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end
