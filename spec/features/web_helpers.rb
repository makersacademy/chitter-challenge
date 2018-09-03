def post_chits
  visit('/')
  click_button 'sign up'
  fill_in :email, with: 'test@example.com'
  fill_in :password, with: 'password123'
  click_button('submit')
end
