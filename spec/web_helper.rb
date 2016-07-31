def sign_up(email: 'test@email.com', name: 'tester', user_name: 'testmiester', password: 'Password123', password_confirmation: 'Password123')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,                 with: email
  fill_in :name,                  with: name
  fill_in :user_name,             with: user_name
  fill_in :password,              with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'test@email.com', password: 'Password123')
  visit 'sessions/new'
  fill_in :email,     with: email
  fill_in :password,  with: password
  click_button 'Sign in'
end

def post_peep
  visit '/peeps'
  fill_in 'message', with: 'This is a Peep'
  click_button 'Peep'
end
