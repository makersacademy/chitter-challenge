def sign_up(first_name: 'Bob', last_name: 'By', password: 'bobByg',
  email:'bob.by@gmail.com')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign up'
end
