def sign_up
  visit '/'
  fill_in 'e_mail', with: 'nst@mail.com'
  fill_in 'name', with: 'Natalia'
  fill_in 'username', with: 'Nat-Nat'
  fill_in 'password', with: '123456'
  click_button 'Sign up'
end
