def sign_up(first_name: 'Bob', last_name: 'By', password: 'bobByg',
  email:'bob.by@gmail.com', username: 'bob.byg')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign up'
end

def create_user
  User.create(first_name: 'Bob', last_name: 'By', password: 'bobByg',
    email:'bob.by@gmail.com', username: 'bob.byg')
end

def sign_in
  visit '/sessions/new'
  fill_in :email, with: 'bob.by@gmail.com'
  fill_in :password, with: 'bobByg'
  click_button 'Sign in'
end
