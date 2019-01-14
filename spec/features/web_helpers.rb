def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'C.H Itter'
  fill_in :username, with: 'chitter_forever'
  fill_in :email, with: 'chitter@chittering.com'
  fill_in :password, with: 'gnirettihc123'
  click_button 'Sign up'
end

def sign_in
  click_button 'Sign in'
  fill_in :email, with: 'chitter@chittering.com'
  fill_in :password, with: 'gnirettihc123'
  click_button 'Sign in'
end
