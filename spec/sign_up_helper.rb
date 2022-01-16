def sign_up_helper
  visit('/registrations/sign-up')
  fill_in('name', with: 'Mr. Test')
  fill_in('username', with: 'mr_test')
  fill_in('password', with: 'password')
  fill_in('email', with: 'test@test-mail.com')
  click_button('Sign Up')
end
