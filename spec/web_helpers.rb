def sign_up
  visit('/users/new')
  fill_in('email', with: 'pug@gmail.com')
  fill_in('name', with: 'Pug')
  fill_in('username', with: 'puggy')
  fill_in('password', with: 'password')
  fill_in('password_confirmation', with: 'password')
  click_button 'Sign up'
end
