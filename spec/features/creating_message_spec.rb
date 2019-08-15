feature 'adding a new message' do
  scenario 'a user can add new message to Chitter' do

    visit('/messages/new')
    fill_in('text', with: 'I have my own Chitter!')
    click_button('add')

    expect(page).to have_content 'I have my own Chitter!'
  end
end