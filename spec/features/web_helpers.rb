def sign_up(email: 'santa@northpole.com', password: 'rudolph',
            password_confirmation: 'rudolph')
  visit '/users/new'
  fill_in 'username', with: 'santaclaus'
  fill_in 'name', with: 'Santa'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end
