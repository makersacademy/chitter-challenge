feature 'posting message' do
  scenario 'post a new message' do
    visit '/messages/new'
    fill_in('message', with: 'Hey, How are you today?')
    click_button('post message')
    expect(page).to have_content('Hey, How are you today?')
  end
end
