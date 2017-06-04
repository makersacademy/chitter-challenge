def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'kavita@example.com'
  fill_in :password, with: 'makers'
  fill_in :password_confirmation, with: 'makers'
  fill_in :name, with: 'Kavita'
  fill_in :username, with: 'kkavita92'
  click_button 'Sign Up'
end

def wrong_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'kavita@example.com'
  fill_in :password, with: 'makers'
  fill_in :password_confirmation, with: 'wrong'
  fill_in :name, with: 'Kavita'
  fill_in :username, with: 'kkavita92'
  click_button 'Sign Up'
end

def post_new_peep
  click_button 'New Peep'
  fill_in('new_peep', :with => 'Hello world!')
  click_button('PEEP')
end

def log_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Login'
end
