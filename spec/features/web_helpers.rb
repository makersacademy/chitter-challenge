def sign_up
  visit '/sign-up'
  fill_in 'Name', with: 'Ed'
  fill_in 'Handle', with: '@Ed'    
  fill_in 'Password', with: 'password1'
  fill_in 'Email', with: 'ed@generic_mail.com'
  click_button 'Submit'
end