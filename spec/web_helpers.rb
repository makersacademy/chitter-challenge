def sign_up
  visit '/users/new'
  fill_in 'email', with: 'randomail@gmail.com'
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'Alessandro'
  fill_in 'username', with: 'terminalobject'
  click_button 'Sign up'
end 
