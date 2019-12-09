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

def someone_else_signs_up_and_signs_in
  visit '/'
  click_on 'Sign Up'

  fill_in 'new email', with: 'jimmy@example.com'
  fill_in 'new username', with: 'Jimmy456'
  fill_in 'new password', with: '6789trufflebutter'
  click_on 'Sign Up'

  fill_in 'email', with: 'jimmy@example.com'
  fill_in 'password', with: '6789trufflebutter'
  click_on 'Log In'
end
