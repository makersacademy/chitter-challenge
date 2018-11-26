feature 'Full features' do

  scenario 'A user can see messages' do
    Message.add(title: 'First Post', body: 'Hello World')
    Message.add(title: 'Second Post', body: 'Hello London')
    Message.add(title: 'Third Post', body: 'Hello Brazil')

    visit('/messages')

    expect(page).to have_content('Hello World')
    expect(page).to have_content('Hello London')
    expect(page).to have_content('Hello Brazil')
  end

  scenario 'User can post a message to chitter' do
    visit('/messages/new')
    fill_in('message_body', with: 'Hello World')
    fill_in('message_title', with: 'First post')
    click_button 'Submit'
    expect(page).to have_content('Hello World')
    expect(page).to have_content('First post')
  end

end
