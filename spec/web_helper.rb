def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,    with: 'foobar'
  fill_in :email,    with: 'foobar@example.com'
  fill_in :name,    with: 'foo bar'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button 'Sign up'
end

def bad_confirmation_sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,    with: 'foobar'
  fill_in :email,    with: 'foobar@example.com'
  fill_in :name,    with: 'foo bar'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'different'
  click_button 'Sign up'
end
