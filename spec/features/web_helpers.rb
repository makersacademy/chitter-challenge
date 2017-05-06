def signup
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in('username', with: 'Foo')
  fill_in('email', with: 'foo@bar.com')
  fill_in('password', with: 'password1')
  click_button('Sign up')
end
