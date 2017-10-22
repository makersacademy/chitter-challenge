def sign_up(email: 'alice@example.com',
            password: 'hello123',
            password_confirmation: 'hello123')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

# def log_in(email: 'alice@example.com',
#            password: 'hello123')
#   visit '/'
#   fill_in :email, with: email
#   fill_in :password, with: password
#   click_button 'Submit'
# end
