feature 'users can see multiple messages in reverse chronological order' do
   scenario 'users can see multiple messages on the notice board' do
     visit '/messages/new'
     fill_in 'user_name', with: 'Nikolaos'
     fill_in 'message', with: 'MA Chitter is a cool app'
     click_button 'Peep'
     expect { post_new_message }.to change(Message, :count).by 1
   end
 end
