def post_new_message
  visit '/messages/new'
  fill_in 'user_name', with: 'Nikolaos'
  fill_in 'message', with: 'MA Chitter is a cool app'
  click_button 'Peep'
end
