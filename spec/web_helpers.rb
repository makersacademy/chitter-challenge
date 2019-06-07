def login
  visit '/'
  fill_in('username', with: 'Peter')
  fill_in('password', with: '12345')
  click_button('Login')
end
