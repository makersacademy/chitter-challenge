def sign_up
  visit('/')
  click_on 'Sign Up'
  expect(page.current_path).to eq('/signup')
  fill_in :username, with: 'myusername'
  fill_in :email, with: 'myemail@email.com'
  fill_in :password, with: 'mypassword'
  click_on 'Submit'
end

def post_peep
  sign_up
  fill_in :peep, with: 'Writing a peep'
  click_button 'Submit your peep'
end
