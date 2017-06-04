def post_a_message
  visit('/messages/new')
  fill_in 'content', with: 'peep'
  click_button 'Send message'
end

def post_multiple_message
  visit('/messages/new')
  fill_in 'content', with: 'first message'
  click_button 'Send message'
  visit('/messages/new')
  fill_in 'content', with: 'second message'
  click_button 'Send message'
end

def sign_up
  visit('/users/new')
  fill_in :email, with: 'cat@example.com'
  fill_in :password, with: 'h123'
  click_button 'Sign up'
end
