def post_peep
  visit '/'
  click_link 'Write a Peep'
  fill_in 'text', :with => 'My first peep'
  click_button 'Share Peep'
end

def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'name', :with => 'name1'
  fill_in 'username', :with => 'username1'
  fill_in 'email', :with => 'name1@email.com'
  fill_in 'password', :with => 'password'
  click_button 'Sign Up'
end