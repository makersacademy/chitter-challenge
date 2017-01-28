
def sign_up(email: 'test@example.com',
              password: '12345678',
              password_confirmation: '12345678')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,     with: 'test@example.com'
  fill_in :password,  with: 'test123'
  click_button 'Sign up'
end
