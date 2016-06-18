def sign_up
  fill_in :first_name, with: 'Alex'
  fill_in :surname, with: 'Mellor'
  fill_in :username, with: 'Alex'
  fill_in :email, with: 'alex@email.com'
  fill_in :password, with: 'Pa55word'
  click_button 'Sign up'
end
