def sign_up
  visit '/users/new'
  fill_in :name, with: 'John Smith'
  fill_in :username, with: 'johnsmith'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
  click_button 'Sign up'
end
