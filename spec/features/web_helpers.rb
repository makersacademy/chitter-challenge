def signup
  visit '/'
  click_link('Signup')
  fill_in("name", with: 'Testy McTester')
  fill_in("username", with: 'Test')
  fill_in("email", with: 'test@gmail.com')
  fill_in("password", with: 'Test123')
  click_button('Signup')
end