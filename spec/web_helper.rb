def sign_up 
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'luke@example.com'
  fill_in :name, with: 'Luke'
  fill_in :handle, with: 'lukeaveil'
  fill_in :password, with: '123'
  click_button 'Sign up'
end