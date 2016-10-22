def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :user_name, with: 'Tester1'
  fill_in :email, with: 'tester1@tester.com'
  fill_in :password, with: 'testpass1'
  fill_in :password_confirmation, with: 'testpass1'
  click_button 'Create account'
end
