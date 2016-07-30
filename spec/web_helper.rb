def sign_up(password_confirmation: 'hungover!', email: 'thady@example.com')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :user_name, with: 'CONDOTH1'
  fill_in :email,    with: email
  fill_in :name, with: 'Thady Condon'
  fill_in :password, with: 'hungover!'
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in
  visit '/sessions/new'
  fill_in :user_name, with: 'CONDOTH1'
  fill_in :password, with: 'hungover!'
  click_button 'Sign in'
end
