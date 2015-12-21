def sign_up(name: 'Andrew Htun', username: 'htunny', email: 'andy_htun@hotmail.com', password: 'Apples', password_confirmation: 'Apples')
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
