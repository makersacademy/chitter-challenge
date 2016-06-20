def sign_up(email: 'alex@email.com',
           password: '12345678',
           password_confirmation: '12345678')
  visit '/user/signup'
  fill_in :first_name, with: 'Alex'
  fill_in :surname, with: 'Mellor'
  fill_in :username, with: 'Alex'
  fill_in :email, with: 'alex@email.com'
  fill_in :password, with: 'Pa55word'
  fill_in :password_confirmation, with: 'Pa55word'
  click_button 'Sign up'
end
