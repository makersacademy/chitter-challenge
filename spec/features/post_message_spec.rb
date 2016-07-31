feature 'post message' do
  scenario 'a user can post a message for others to see' do
    visit '/messages'
    fill_in :peep, with: 'My first peep!'
    click_button 'Peep'
    expect(page).to have_content 'My first peep!'
  end
end
