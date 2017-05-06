def signs_in_successfully
  visit '/signup'
  fill_in :email, with: 'example@email.com'
  fill_in :name, with: 'Jack Dorsey'
  fill_in :username, with: 'jack'
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'password'
  click_button 'Submit'
end

def signs_up_with_mismatched_passwords
  visit '/signup'
  fill_in :email, with: 'example@email.com'
  fill_in :name, with: 'Jack Dorsey'
  fill_in :username, with: 'jack'
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'badpassword'
  click_button 'Submit'
end

def signs_in_without_email
  visit '/signup'
  fill_in :name, with: 'Jack Dorsey'
  fill_in :username, with: 'jack'
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'password'
  click_button 'Submit'
end

def signs_in_with_bad_email
  visit '/signup'
  fill_in :email, with: 'bad@notright'
  fill_in :name, with: 'Jack Dorsey'
  fill_in :username, with: 'jack'
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'password'
  click_button 'Submit'
end
