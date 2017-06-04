def post_new_message
  visit '/messages/new'
  fill_in 'user_name', with: 'Rupert'
  fill_in 'message', with: 'I do love this tartan scarf #ScarfsForBears #my_first_message'
  click_button 'Peep'
end

def post_different_mesage
  Message.create(message: 'different_message', created_at: Time.now + 5)
  visit '/messages'
end
