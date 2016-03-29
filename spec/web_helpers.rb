def create_user
  visit '/users/new'
  fill_in :email, with: 'colin@colin.com'
  fill_in :password, with: 'colinpw'
  fill_in :name, with: 'colin'
  fill_in :username, with: 'colinu'
  click_button 'Create account'
end


