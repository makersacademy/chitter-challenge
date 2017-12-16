feature 'Messages' do

  scenario 'users can post messages' do
    visit '/chat'
    fill_in :message, with: 'Hello World!'
    click_on 'PeepIt'
    expect(page).to have_content 'Hello World!'
  end

  scenario 'messages are displayed in reverse chronological order' do
    visit '/chat'
    send_peep('Hello World!')
    send_peep('Goodbye Cruel World!')
    expect(page).to have_content 'Hello World! Goodbye Cruel World!'
  end
end
