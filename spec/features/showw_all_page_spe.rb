feature 'Add message' do
  scenario 'Test that when message is posted it is added to page' do 
    visit('/')
    fill_in 'message', with: 'first message'
    click_button 'Add'
    click_button 'Show'
    expect(page).to have_content 'first message'
  end 
end 