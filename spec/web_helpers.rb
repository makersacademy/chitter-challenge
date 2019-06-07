def login(username = 'Peter', password = '12345')
  visit '/'
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('Login')
end
