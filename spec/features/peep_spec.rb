feature 'message' do
  scenario 'post a message' do
    visit '/'
    fill_in 'message', with: 'test message'
    click_button 'Submit'
    expect(page).to have_content 'test message'
  end
end
