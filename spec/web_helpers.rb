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

def sign_in(email: 'andy_htun@hotmail.com', password: 'Apples')
  User.create(email: email, password: password)
  visit '/session/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end

def sign_out
  visit '/chat'
   expect(page.status_code).to eq(200)
  click_button 'Log out'
end
