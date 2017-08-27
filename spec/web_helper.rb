def sign_up
  visit '/homepage'
  click_button 'Sign Up'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'person@example.com'
  click_button 'Sign Up'
end
