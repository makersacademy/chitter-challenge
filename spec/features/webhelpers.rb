def sign_up(email: 'joe@example.com',
            name: 'Joe Bloggs',
            username: 'BloggysMalone',
            password: 'shoobydooby',
            password_confirmation: 'shoobydooby')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'submit'
end
