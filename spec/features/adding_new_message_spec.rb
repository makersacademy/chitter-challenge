feature 'Adding new message' do

  scenario 'User can post a message to chitter' do
    visit('/messages/new')
    fill_in('message_body', with: 'Hello World')
    fill_in('message_title', with: 'First post')
    click_button 'Submit'
    expect(page).to have_content('Hello World')
    expect(page).to have_content('First post')
  end

end