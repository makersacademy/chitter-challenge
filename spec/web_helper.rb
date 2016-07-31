
def register(email: 'jck_catchall@outlook.com',
            name: 'jose',
            user_name: 'jck',
            password: 'abc',
            password_confirmation: 'abc')
  visit 'users/new'
  expect(page.status_code).to eq 200

  fill_in :email, with: email
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'REGISTER'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'SIGN IN'
end
