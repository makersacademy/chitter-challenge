def peep
  visit '/'
  fill_in 'content', with: 'Hello world, this is my first Peep!!'
  click_button 'Peep'
end

def sign_up_other_user_and_peep
  visit '/users/new'
  fill_in :name, with: 'Tifa Lockheart'
  fill_in :email, with: 'barret@final-fantasy-vii.com'
  fill_in :username, with: 'fisticuffs'
  fill_in :password, with: 'CloudStrife'
  fill_in :password_confirmation, with: 'CloudStrife'
  click_button 'Sign up'
  peep
end
