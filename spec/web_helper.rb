def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,     with: 'Lisa Jones'
  fill_in :email,    with: 'lisa@example.com'
  fill_in :handle,   with: '@JonesL'
  fill_in :password, with: 'Peaches!'
  click_button 'Sign up'
end
