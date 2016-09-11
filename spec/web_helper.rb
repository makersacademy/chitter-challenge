def sign_up
  visit '/users/new'
  fill_in(:name, with: 'New User')
  fill_in(:email, with: 'test@test.com')
  click_button('sign up')
end
