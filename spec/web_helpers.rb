def sign_up_test
  visit('/sign_up')
  fill_in 'username', with: 'wemmm'
  fill_in 'name', with: 'Jenny'
  fill_in 'email', with: 'jenny@wem.com'
  fill_in 'password', with: '1234'
  click_button('Submit')
end
