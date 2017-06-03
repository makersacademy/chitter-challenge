
feature 'Post message' do
  scenario 'User is able to post a message to chitter' do
    visit('/messages/new')
    fill_in 'content', with: 'peep'
    click_button 'Send message'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'peep'
  end
end
