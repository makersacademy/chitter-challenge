def sign_in
  visit '/'
  fill_in('username', with: 'stro2275')
  fill_in('name', with: 'Jen S.')
  fill_in('email', with: 'jen@gmail.com')
  fill_in('password', with: 'password123')

  click_button('Submit')
end
