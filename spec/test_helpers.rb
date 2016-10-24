def sign_up(email: 'bubble@bubbles.com',
            name: 'Tim',
            username: 'Bubbles',
            password: 'password', 
            confirm_password: 'password')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in('email', with: email)
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('confirm_password', with: confirm_password)
  click_button('Register')
end

def log_in
  visit '/login'
  expect(page.status_code).to eq(200)
  fill_in('username_login', with: 'Bubbles')
  fill_in('password_login', with: 'password')
  click_button('Log in')
end

def peep(message)
  visit "/"
  fill_in("message", with: message)
  click_button "Peep"
end
