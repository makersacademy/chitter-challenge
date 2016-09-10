def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: "database_guru@gmail.com"
  fill_in :name, with: 'Lord Vader'
  fill_in :user_name, with: 'darth'
  fill_in :password, with: "awesome123"
  fill_in :password_confirmation, with: "awesome123"
  click_button 'sign up'
end
