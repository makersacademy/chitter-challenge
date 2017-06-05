def signup
  visit '/'
  fill_in 'name', with: 'Ian'
  fill_in 'email', with: 'ian@gmail.com'
  # fill_in 'password', with: 'Shhh'
  # fill_in 'password_confirmation', with: 'Shhh'
  click_button 'submit'
end
