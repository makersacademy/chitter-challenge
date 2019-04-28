feature 'posting message' do
  scenario 'post a new message' do
    visit '/messages/new'
    fill_in('message', with: 'Hey, How are you today?')
    click_button('post message')
    expect(page).to have_content('Hey, How are you today?')
  end

  scenario 'post a new message with timestamp' do
    visit '/messages/new'
    fill_in('message', with: 'Hey, How are you today?')
    time = DateTime.now.strftime('%Y-%m-%d %I:%M:%S')
    click_button('post message')
    expect(page).to have_content('Hey, How are you today?')
    expect(page).to have_content(time)
  end

end
