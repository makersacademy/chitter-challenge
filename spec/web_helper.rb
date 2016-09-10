def sign_up(name, email, username, password, password_confirmation)
  visit '/users/new'
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign me up!')
end
