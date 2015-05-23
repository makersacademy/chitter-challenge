def login(username, password)
  visit '/sessions/new'
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('login2')
end
