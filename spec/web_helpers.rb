def create_peep
  visit '/peeps/new'
  fill_in 'name', with: 'Jack'
  fill_in 'message', with: 'Another peep!'
  click_button 'Submit'
end

def sign_up(name:'Christopher Robin', user_name: 'Chris', email: 'chris@mail.com', password: 'poohbear123', password_confirmation: 'poohbear123')
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'user_name', with: user_name
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def log_in(email: 'mail@mail.com', password: 'password')
  visit '/sessions/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Submit'
end
