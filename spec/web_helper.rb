def post_new_message
  visit '/messages/new'
  fill_in 'user_name', with: 'Rupert'
  fill_in 'message', with: 'I do love this tartan scarf #ScarfsForBears'
  click_button 'Peep'
end
