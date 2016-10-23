def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'tester1@tester.com'
  fill_in :password, with: 'testpass1'
  fill_in :password_confirmation, with: 'testpass1'
  click_button 'Create account'
end

def sign_in(email:,password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
