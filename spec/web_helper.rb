def sign_up
  visit ('/users/new')
  fill_in 'email', with: 'jollygreengiant@gmail.com'
  fill_in 'password', with: '2016'
  fill_in 'name', with: 'Joe Giant'
  fill_in 'username', with: 'jollygreengiant'
  click_button('Submit')
end
