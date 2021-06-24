feature 'Posting a message' do
  scenario 'user can post a new message which is then displayed' do
    visit('/messages/new')
    fill_in('message', with: 'chitter')
    click_button('add')
    expect(current_path).to eq('/messages/new')
    expect(page).to have_content('what is on your mind?......')
  end
end