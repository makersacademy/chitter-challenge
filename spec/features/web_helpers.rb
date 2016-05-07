def sign_up
  visit '/sign-up'
  fill_in 'name', with: 'Matt'
  fill_in 'username', with: 'iammatthewward'
  fill_in 'email', with: 'matt@email.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Sign up'
end

def incorrect_sign_up
  visit '/sign-up'
  fill_in 'name', with: 'Matt'
  fill_in 'username', with: 'iammatthewward'
  fill_in 'email', with: 'matt@email.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'incorrect'
  click_button 'Sign up'
end
