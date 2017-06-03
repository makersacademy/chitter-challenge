
feature 'Post message' do

  scenario 'User is able to post a message to chitter' do
    visit('/messages/new')
    fill_in 'content', with: 'peep'
    click_button 'Send message'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'peep'
  end

  scenario 'User is able to see messages in reverse chronological order' do
    visit('/messages/new')
    fill_in 'content', with: 'first message'
    click_button 'Send message'
    visit('/messages/new')
    fill_in 'content', with: 'second message'
    click_button 'Send message'
    visit('/messages')
    first_idx = page.body.index('first message')
    second_idx = page.body.index('second message')
    expect(first_idx).to be > second_idx
  end

  scenario 'User can see the time at which the message was made' do
    visit('/messages/new')
    fill_in 'content', with: 'peep'
    click_button 'Send message'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'peep'
  end



end
