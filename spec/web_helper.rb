def sign_up
  visit '/'
  expect(page.status_code).to eq 200
  click_link 'create user account'
  expect(current_path).to eq '/users/new'
  fill_in :email, with: "database_guru@gmail.com"
  fill_in :name, with: 'Lord Vader'
  fill_in :user_name, with: 'darth'
  fill_in :password, with: "awesome123"
  fill_in :password_confirmation, with: "awesome123"
  click_button 'sign up'
end

def sign_up_with_mismatched_password
  visit '/'
  expect(page.status_code).to eq 200
  click_link 'create user account'
  expect(current_path).to eq '/users/new'
  fill_in :email, with: "database_guru@gmail.com"
  fill_in :name, with: 'Lord Vader'
  fill_in :user_name, with: 'darth'
  fill_in :password, with: "awesome123"
  fill_in :password_confirmation, with: "luke"
  click_button 'sign up'
end

def sign_in
  visit '/'
  expect(page.status_code).to eq 200
  click_link 'sign in'
  expect(current_path).to eq '/sessions/new'
  fill_in :user_name, with: user.user_name
  fill_in :password, with: 'awesome123'
  click_button 'sign in'
end

def sign_in_incorrect
  visit '/'
  expect(page.status_code).to eq 200
  click_link 'sign in'
  expect(current_path).to eq '/sessions/new'
  fill_in :user_name, with: user.user_name
  fill_in :password, with: 'wrong password'
  click_button 'sign in'
end
