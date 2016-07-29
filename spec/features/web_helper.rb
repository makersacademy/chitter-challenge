def sign_up( user_name: 'samjbro',
             email: 'sam@email.com',
             password: '12345678',
             password_confirmation: '12345678')
  expect(page.status_code).to eq 200
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up!'
end