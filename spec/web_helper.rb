def sign_up

  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Tom Spencer'
  fill_in :user_name, with: 'tomspencer'
  fill_in :password, with: 'tomspencer'
  click_button 'submit'

end

def sign_in
  visit '/'
  click_button 'Sign In'
  fill_in :user_name, with: 'tomspencer'
  fill_in :password, with: 'tomspencer'
  click_button 'submit'
end

def sign_in_with_wrong_password
  visit '/'
  click_button 'Sign In'
  fill_in :user_name, with: 'tomspencer'
  fill_in :password, with: '1sdfafeqrga'
  click_button 'submit'
end
