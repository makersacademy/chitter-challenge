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

def sign_up_with_mismatched_password
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: "database_guru@gmail.com"
  fill_in :name, with: 'Lord Vader'
  fill_in :user_name, with: 'darth'
  fill_in :password, with: "awesome123"
  fill_in :password_confirmation, with: "luke"
  click_button 'sign up'
end

def sign_in
  visit '/sessions/new'
  expect(page.status_code).to eq 200
  fill_in :user_name, with: user.user_name
  fill_in :password, with: 'awesome123'
  click_button 'sign in'
end

def sign_in_incorrect
  visit '/sessions/new'
  expect(page.status_code).to eq 200
  fill_in :user_name, with: user.user_name
  fill_in :password, with: 'wrong password'
  click_button 'sign in'
end
