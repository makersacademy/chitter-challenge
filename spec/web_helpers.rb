def sign_up(username: 'AlbusD',
  email: 'albus_dumbledore@hogwarts.co.uk',
              password: 'Fawkes',
              password_confirmation: 'Fawkes')
  visit '/'
  click_button 'Sign up!'
  expect(current_path).to eq('/signup')
  fill_in :name, with: 'Albus Dumbledore'
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up!'
end

def sign_in(email:, password:)
  visit '/'
  click_button 'Log in'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end
