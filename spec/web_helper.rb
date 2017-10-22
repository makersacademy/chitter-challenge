def sign_up

  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Tom Spencer'
  fill_in :user_name, with: 'tomspencer'
  fill_in :password, with: 'tomspencer'
  click_button 'submit'

end
