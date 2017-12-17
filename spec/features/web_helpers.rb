def sign_up
  visit('/')
  fill_in 'username', with: 'Alex Ample'
  fill_in 'email_address', with: 'a@b.com'
  fill_in 'password', with: ';kdafj'
  click_button 'Sign up'
end
