def sign_up
  visit('/signup')
  fill_in 'name', with: 'Ellie'
  fill_in 'handle', with: 'ellieSMASH'
  fill_in 'email', with: 'test@email.com'
  fill_in 'password', with: 'password123'
  click_button('Create my account')
end
