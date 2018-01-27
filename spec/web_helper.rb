def sign_up
  visit '/sign_up'
  fill_in 'name', with: 'Gerald'
  fill_in 'email', with: 'test@test.com'
  click_button 'Register'
end
