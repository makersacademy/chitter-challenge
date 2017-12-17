feature 'users can see multiple messages in reverse chronological order' do
   scenario 'users can see multiple messages on the notice board' do
     sign_up
     post_new_message
     expect { post_new_message(message: 'MA Chitter kicks Twitter A@@! - 2') }.to change(Message, :count).by 1
     expect(page).to have_content 'MA Chitter is a cool app - 1'
     expect(page).to have_content 'MA Chitter kicks Twitter A@@! - 2'
   end

   scenario 'messages appear with a time-stamp' do
    time = Time.now
    sign_up
    post_new_message
    expect(page).to have_content time.strftime("%Y-%m-%dT%H:%M:%S")
   end

   scenario 'messages appear in chronological order' do
    sign_up
    post_new_message
    sleep(1)
    post_new_message(message: 'MA Chitter kicks Twitter A@@! - 2')
    expect(page).to have_css('ul#messages li:first-child', text: 'MA Chitter kicks Twitter A@@! - 2')
   end

 end
