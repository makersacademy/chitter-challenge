def post_peep(text = 'My first peep')
  visit '/'
  click_button 'Write a Peep'
  fill_in 'text', :with => text
  click_button 'Share Peep'
end

def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', :with => 'name1'
  fill_in 'username', :with => 'username1'
  fill_in 'email', :with => 'name1@email.com'
  fill_in 'password', :with => 'password'
  click_button 'Sign Up'
end
