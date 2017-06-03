
feature 'Post message' do
  scenario 'User is able to post a message to chitter' do
    visit('/messages')
    fill_in 'contex', with: 'peep'
    click_button 'Send message'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'peep'
  end
end
