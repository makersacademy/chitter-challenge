feature 'users can see multiple messages in reverse chronological order' do
  scenario 'users can see multiple messages on the notice board' do
    sign_up
    post_new_message
    expect { post_new_message(message: 'different_message') }.to change(Message, :count).by 1
    expect(page).to have_content 'first_message'
    expect(page).to have_content 'different_message'
  end

  scenario 'messages appear with a time-stamp' do
    sign_up
    post_new_message
    expect(page).to have_content Time.now.strftime("%Y-%m-%dT%H:%M:%S")
  end

  scenario 'messages appear in chronological order' do
    sign_up
    post_new_message
    sleep(1)
    post_new_message(message: 'different_message')
    expect(page).to have_css('#messages .panel:first-child .panel-body', text: 'different_message')
  end
end
