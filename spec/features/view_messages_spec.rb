feature 'Users can see multiple messages in reverse chronological order' do
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

  let!(:user) do
    User.create(user_name: 'test_user',
                user_email: 'test_user@tests.test',
                password: 'testing123',
                password_confirmation: 'testing123'
                )
  end

  scenario 'messages appear in chronological order' do
    sign_up
    post_new_message
    Message.create(user_id: user.id, message: 'different_message', created_at: Time.now + 5)
    visit '/messages'
    expect(page).to have_css('#messages .panel:first-child .panel-body', text: 'different_message')
  end
end
