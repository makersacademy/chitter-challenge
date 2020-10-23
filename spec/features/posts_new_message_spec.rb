feature 'posting new messages' do
  scenario 'is able to post a new message, and then see it' do
    visit '/messages'
    click_button 'Peep'
    fill_in 'peep', with: 'Test Peep!'
    click_button 'Submit'
    expect(page).to have_content 'Test Peep!'
  end
end
