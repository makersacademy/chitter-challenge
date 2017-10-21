def sign_up
  visit '/users/new'
  fill_in :user, with: "alice@example.com"
  fill_in :password, with: 'hello123'
  click_button 'Submit'
end
