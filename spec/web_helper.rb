def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :name, with: 'John Smith'
  fill_in :user_name, with: 'j.smith90'
  fill_in :email, with: 'john.smith@example.co.uk'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button 'Create User Account'
end
