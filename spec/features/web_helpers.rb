def sign_up( user_name: 'samjbro',
             email: 'sam@email.com',
             password: '12345678',
             password_confirmation: '12345678')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  user = User.new
  click_button 'Sign up!'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end