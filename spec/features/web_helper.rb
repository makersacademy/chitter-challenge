def sign_up
  visit '/sign_up'
  fill_in 'name', with: 'John'
  fill_in 'username', with: 'John_Doe'
  fill_in 'email', with: 'john_doe@mail.com'
  fill_in 'password', with: 'secret'
  click_button 'Create my Account'
end
