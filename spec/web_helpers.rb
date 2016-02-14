def sign_up
  visit ('/users/new')
  expect(page.status_code).to eq(200)
  fill_in('username', with: 'Buoyant Bobba')
  fill_in('name', with: 'Bobba Fett')
  fill_in('email_address', with: 'bobb@fett.com')
  click_button('Save')
end
