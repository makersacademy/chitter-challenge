def sign_up_with_valid_details
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'TopS3cr3t'
  fill_in :password_confirmation, with: 'TopS3cr3t'
  fill_in :name, with: 'John Doe'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end
