def create_peep
  visit '/peeps/new'
  expect(page.status_code).to eq(200)
  fill_in 'message', with: 'Setting up Chitter. This is my first peep.'
  click_button 'Post'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'zoe@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up'
end
