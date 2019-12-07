def sign_up_and_sign_in
  visit '/'
  click_on 'Sign Up'

  fill_in 'new email', with: 'sam@example.com'
  fill_in 'new username', with: 'Sam123'
  fill_in 'new password', with: '1234icecream'
  click_on 'Sign Up'

  fill_in 'email', with: 'sam@example.com'
  fill_in 'password', with: '1234icecream'
  click_on 'Log In'
end
