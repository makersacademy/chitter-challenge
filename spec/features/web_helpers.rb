def create_peep(message)
  visit '/create_peep'
  fill_in 'peep', with: message
  click_button 'Post'
end

def sign_up(name:,handle:,email:,password:)
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: name
  fill_in 'handle', with: handle
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Submit'
end