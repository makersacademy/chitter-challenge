def sign_up(full_name: 'Incredible Yev',
            email: 'incredible@yev.com',
            password: 'bla-bla-bla',
            password_confirmation: 'bla-bla-bla')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :full_name, with: full_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Sign up')
end

def log_in(email: 'incredible@yev.com',
           password: 'bla-bla-bla')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end
