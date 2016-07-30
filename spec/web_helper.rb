def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :user_name, with: 'CONDOTH1'
  fill_in :email,    with: 'thady@example.com'
  fill_in :password, with: 'hungover!'
  fill_in :name, with: 'Thady Condon'
  click_button 'Sign up'
end
