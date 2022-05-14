feature 'messages behaves as expected' do
  scenario 'user can post a message' do
    visit '/new'
    fill_in 'message', with: 'test message'
    fill_in 'username', with: 'testusername'
    fill_in 'name', with: 'testname'
    click_button 'Send'
    expect(page).to have_content 'test message'
    expect(page).to have_content 'test username'
    expect(page).to have_content 'test name'
  end
end