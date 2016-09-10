def sign_up(name, email, username, password)
  visit '/users/new'
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('Sign me up!')
end
