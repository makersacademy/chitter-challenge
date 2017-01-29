def sign_up(email: 'joe@example.com',
            name: 'Joe Bloggs',
            username: 'BloggsyMalone',
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

def sign_in(email: 'joe@example.com',
            password: 'shoobydooby')
  visit '/sessions/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'submit'
end
