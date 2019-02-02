def post_three_messages
  message = 'I am a first peep!'
  message_2 = 'I am a second peep!'
  message_3 = 'I am a third peep!'
  visit '/'
  fill_in 'peep', with: message
  click_button 'Submit'
  fill_in 'peep', with: message_2
  click_button 'Submit'
  fill_in 'peep', with: message_3
  click_button 'Submit'
end

def post_one_message
  message = 'I am a new peep!'
  visit '/'
  fill_in 'peep', with: message
  click_button 'Submit'
end