feature 'users can see multiple messages in reverse chronological order' do
   scenario 'users can see multiple messages on the notice board' do
     post_new_message
     expect { post_new_message }.to change(Message, :count).by 1
   end
 end
