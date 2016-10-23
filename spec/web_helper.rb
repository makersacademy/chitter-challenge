def sign_up(name: 'John Smith', user_name: 'j.smith90',
            email: 'john.smith@example.co.uk',
            password: 'password', password_confirmation: 'password')

  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Create User Account'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
