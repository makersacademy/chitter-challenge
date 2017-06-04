feature 'users can see multiple messages in reverse chronological order' do
  scenario 'users can see multiple messages on the notice board' do
    post_new_message
    expect { post_different_mesage }.to change(Message, :count).by 1
    expect(page).to have_content 'first_message'
    expect(page).to have_content 'different_message'
  end

  scenario 'messages appear with a time-stamp' do
    post_new_message
    expect(page).to have_content Time.now.strftime("%Y-%m-%dT%H:%M:%S")
  end

  scenario 'messages appear in chronological order' do
    post_new_message
    post_different_mesage
    expect(page).to have_css('ul#messages li:first-child', text: 'different_message')
  end
end
