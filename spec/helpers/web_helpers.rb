def create_a_peep
  visit '/peeps/new'
  fill_in 'message', with: 'A peep with a hashtag'
  fill_in 'hashtags', with: 'first'
  click_button 'Post Peep!'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in 'name', with: 'Pete Smith'
  fill_in 'email', with: 'pete@example.com'
  fill_in 'username', with: 'peteypops'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password123'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
