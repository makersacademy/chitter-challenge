def sign_up
  visit '/signup'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'john.smith@yournamedomain.co.uk'
  fill_in :password, with: 'football'
  fill_in :password_confirmation, with: 'football'
  click_button 'Create account'
end
