feature 'users can see multiple messages in reverse chronological order' do
  scenario 'users can see multiple messages on the notice board' do
    Message.create(message: 'I also love tartan scarves #ScarvesForFoxesToo')
    expect { post_new_message }.to change(Message, :count).by 1
    expect(page).to have_content '#ScarvesForFoxesToo'
  end
end
