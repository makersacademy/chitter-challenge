def sign_in
  visit '/sessions/new'
  fill_in :email, with: 'cloud@final-fantasy-vii.com'
  fill_in :password, with: 'tifalockheart'
  click_button 'Sign in'
end
def sign_in_wrong_details
  visit '/sessions/new'
  fill_in :email, with: 'cloud@final-fantasy-vii.com'
  fill_in :password, with: 'AerithGainsborough'
  click_button 'Sign in'
end
def sign_out
  visit '/'
  click_button 'Sign out'
end
def peep
  visit '/'
  fill_in 'content', with: 'Hello world, this is my first Peep!!'
  click_button 'Peep'
end
