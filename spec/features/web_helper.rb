
def sign_up
  visit '/sign-up/new'
  fill_in 'email', with: 'jane@email.com'
  fill_in 'name', with: 'Jane Doe'
  fill_in 'username', with: 'jdogg14'
  fill_in 'password', with: 'abcd1234'
  click_button('Sign Up')
end
