def sign_up
  visit '/'
  click_button 'Sign up'
  expect(current_path).to eq('/signup')
  fill_in :name, with: 'Albus Dumbledore'
  fill_in :username, with: 'AlbusD'
  fill_in :email, with: 'albus_dumbledore@hogwarts.co.uk'
  fill_in :password, with: 'Expelliamus'
  click_button 'Sign up!'
end
