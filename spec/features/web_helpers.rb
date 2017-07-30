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
        name: 'Dave Davis')

  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'username', with: username
  fill_in 'name', with: name
  click_button 'Submit'
end

def log_in(username_or_email, password)
#  visit 'sessions/new'
  fill_in 'username_or_email', with: username_or_email
  fill_in 'password', with: password
  click_button 'Submit'
end
