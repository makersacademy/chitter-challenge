def go_to_sign_up
  visit '/'
  click_link 'Sign up'
end

def enter_sign_up_info_and_submit
  fill_in 'Email', with: 'jimmysemail@emailwebsite.com'
  fill_in 'Username', with: 'jimmy324'
  fill_in 'Name', with: 'Jimmy'
  fill_in 'Password', with: 's3cret'
  fill_in 'ConfirmPassword', with: 's3cret'
  click_button 'Submit'
end

def log_in
  fill_in 'Username', with: 'jimmy324'
  fill_in 'Password', with: 's3cret'
  click_button 'Log in'
end
