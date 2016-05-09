def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'reissjohnson@me.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'reiss'
  fill_in :user_name, with: 'reiss1994'
  click_button 'Sign Up'
end
