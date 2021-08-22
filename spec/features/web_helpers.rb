def sign_up
  visit '/sign-up'
  fill_in 'Name', with: 'Ed'
  fill_in 'Handle', with: 'ed209'    
  fill_in 'Password', with: 'password1'
  fill_in 'Email', with: 'ed@generic_mail.com'
  click_button 'Submit'
end

def sign_up_with_existing_email
  visit '/sign-up'
  fill_in 'Name', with: 'Ed'
  fill_in 'Handle', with: 'ed1000'    
  fill_in 'Password', with: 'password1'
  fill_in 'Email', with: 'ed@generic_mail.com'
  click_button 'Submit'
end

def sign_up_with_existing_handle
  visit '/sign-up'
  fill_in 'Name', with: 'Ed'
  fill_in 'Handle', with: 'ed209'    
  fill_in 'Password', with: 'password1'
  fill_in 'Email', with: 'ed2@generic_mail.com'
  click_button 'Submit'
end
