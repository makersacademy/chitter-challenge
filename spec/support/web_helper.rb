def register_a_user
  visit '/'
  click_link 'Register'
  fill_in :name, with: 'Ash Ketchum'
  fill_in :username, with: 'red'
  fill_in :email, with: 'ash@pallet.com'
  fill_in :password, with: 'pikachu123'
  fill_in :confirm_password, with: 'pikachu123'

  click_button 'Register'
end

def login_user
  visit '/'
  click_link 'Login'
  fill_in :email, with: 'ash@pallet.com'
  fill_in :password, with: 'pikachu123'
  click_button 'Login'
end
