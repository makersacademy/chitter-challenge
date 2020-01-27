def sign_up
  visit ('/')
  click_link('Sign Up')
  fill_in :username, with: 'ChittTalker'
  fill_in :first_name, with: 'Testy'
  fill_in :last_name, with: 'Testington'
  fill_in :email, with: 'testy@chittertest.com'
  fill_in :password, with: 'ChittyBangBang123'
  click_button('Sign Up')
end