def sign_up(name: 'name',
        username: 'user',
           email: 'email@example.com',
        password: 'password')

  visit('/user/new')
  expect(page.status_code).to eq 200
  fill_in(:name, with: email)
  fill_in(:username, with: username)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign up')
end
