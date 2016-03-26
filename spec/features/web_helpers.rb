def add_chit(post,tag)
  visit('/new')
  fill_in(:post, with: post)
  fill_in(:tags, with: tag)
  click_button("Chit")
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'AngryAndrew'
  fill_in :email,    with: 'test@test.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end
