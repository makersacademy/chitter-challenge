def messages_log
  visit('/create')
  fill_in 'message', with: "I love Sinatra"
  click_button 'Submit'
  visit('/messages')
end
