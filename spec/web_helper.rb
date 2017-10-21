def sign_up(email: 'peep1@peeps.com',
            password: 'peep1',
            password_confirmation: 'peep1')
  visit '/peeps'
  find('#newUserBtn').click
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end
