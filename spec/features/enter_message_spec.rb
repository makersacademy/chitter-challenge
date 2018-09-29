feature 'enter message page' do
  scenario 'page has correct content' do
    visit('/enter_msg')
    expect(page).to have_content("Please submit your message")
  end
end
