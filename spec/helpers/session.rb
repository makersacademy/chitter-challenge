module SessionHelpers

def sign_up(username='AngryAndrew',email='test@test.com',password='password123',password_confirmation='password123')
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :username, with: username
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email='test@test.com', password='password123')
  visit('/sessions/new')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Login'
end

end
