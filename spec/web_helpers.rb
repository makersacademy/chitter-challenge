def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :user_name,    with: 'jessica123'
  fill_in :email,    with: 'jessica@email.com'
  fill_in :password, with: 'jessica'
  click_button 'Sign up'
end
