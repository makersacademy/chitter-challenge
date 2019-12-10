def user_sign_up
  visit '/'

  click_button('Sign up')
  visit '/users/new'
  fill_in('email', with: 'jess@test.com')
  fill_in('handle', with: 'jesstest')
  fill_in('password', with: 'abcdef')
  click_button('Sign up')

end
