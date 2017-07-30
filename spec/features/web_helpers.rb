def new_peep(content)
  visit '/peeps/new'
  fill_in 'content', with: content
  click_button 'Submit'
end

def sign_up(
        email: 'dave@dave.com',
        password: '12345',
        password_confirmation: '12345',
        username: 'Dave',
        name: 'Dave')

  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'username', with: username
  fill_in 'name', with: name
  click_button 'Submit'
end
