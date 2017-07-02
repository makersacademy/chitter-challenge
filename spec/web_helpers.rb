def create_peep
  visit '/peeps/new'
  fill_in 'name', with: 'Jack'
  fill_in 'message', with: 'Another peep!'
  click_button 'Send peep!'
end

def sign_up
  visit 'users/new'
  fill_in 'name', with: 'Christopher Robin'
  fill_in 'user_name', with: 'Chris'
  fill_in 'email', with: 'chris@mail.com'
  fill_in 'password', with: 'poohbear123'
  click_button 'Sign up'
end
