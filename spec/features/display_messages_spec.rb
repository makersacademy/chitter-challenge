feature 'Displays messages' do
  scenario 'shows the messages' do
    visit('/messages')
    expect(page).to have_content "Message one, blah blah"
    expect(page).to have_content "Message two, blah blah blah"
  end
end