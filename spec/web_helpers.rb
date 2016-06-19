def sign_up(name: 'Jeff',
            email: 'jeff@example.com',
      			password: '1234',
      			password_confirmation: '1234')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
