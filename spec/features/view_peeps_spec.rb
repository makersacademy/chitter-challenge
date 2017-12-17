feature 'users can see multiple messages in reverse chronological order' do
   scenario 'users can see multiple messages on the notice board' do
     Message.create(message: 'MA Chitter is the best!')
     expect { post_new_message }.to change(Message, :count).by 1
     expect(page).to have_content 'MA Chitter is the best!'
   end

   scenario 'messages appear with a time-stamp' do
    time = Time.now
    Message.create(message: 'MA Chitter kicks Twitter A@@!')
    visit '/messages'
    expect(page).to have_content time.strftime("%Y-%m-%dT%H:%M:%S")
   end
 end
