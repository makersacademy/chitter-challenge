feature 'Viewing chats' do
  scenario 'visiting the front page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chatter!'
  end
end
