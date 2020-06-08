def log_in
  visit '/'
  fill_in 'name', with: 'Olatunji'
  fill_in 'username', with: 'ola123'
  fill_in 'email', with: 'olatunji@gmail.com'
  fill_in 'password', with: '12345'
  click_button 'sign up'
end
