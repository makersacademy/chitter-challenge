def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: "Lucas"
  fill_in :email, with: "lucas@lucas.com"
  fill_in :password, with: "password123"
  click_button 'Sign up!'
end

def sign_up(username: 'Lucas',
            email: 'lucas@lucas.com',
            password: 'password123',
            password_confirmation: 'password123')
  visit '/users/new'
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up!'
end
