def sign_up(user)
  visit '/users/new'
  # expect(page.status_code).to eq(200)
  fill_in :name,                  with: user.name
  fill_in :username,              with: user.username
  fill_in :email,                 with: user.email
  fill_in :password,              with: user.password
  fill_in :password_confirmation, with:  user.password_confirmation
  click_button 'Sign up'
end
