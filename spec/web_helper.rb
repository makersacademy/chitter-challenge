def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in 'user_email', :with => "joebloggs@hotmail.com"
  fill_in 'password', :with => "P@ssw0rd1234"
  fill_in 'password_confirmation', :with => "P@ssw0rd1234"
  fill_in 'user_full_name', :with => "Joe Bloggs"
  fill_in 'user_name', :with => "Joeb"
  click_button 'Sign Up'
end
