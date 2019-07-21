def register_user
  visit('/user/new')
  fill_in 'email', with: 'test123@testing.com'
  fill_in 'password', with: 'test1234'
  click_button('Submit')
end
