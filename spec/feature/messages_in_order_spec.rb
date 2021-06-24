feature 'viewing a message' do
  scenario 'user views the messages newest first' do
    visit('/messages/new')
    fill_in('message', with: 'hello chitter')
    click_on('add')
    visit('/messages/new')
    fill_in('message', with: 'hi there')
    click_on('add')
    expect(page).to have_content('what is on your mind?......')
  end
end