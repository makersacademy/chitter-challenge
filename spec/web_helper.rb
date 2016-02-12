def sign_up
  visit '/users/new'
  fill_in :name, with:     'Mr Example'
  fill_in :username, with: 'example26'
  fill_in :email,    with: 'example@example.com'
  fill_in :password, with: 'pa$$word'
  click_button 'Create account'
end
