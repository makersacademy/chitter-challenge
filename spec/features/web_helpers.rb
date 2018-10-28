def sign_up
  visit '/'
  click_button 'sign up'
  fill_in('email', with: 'anouskahopkins@gmail.com')
  fill_in('password', with: 'hello')
  fill_in('name', with: 'anouska hopkins')
  fill_in('username', with: 'ahopkins94')
  click_button 'submit'
end
