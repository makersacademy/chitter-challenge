feature 'messages behaves as expected' do
  before(:each) { empty_test_db }

  scenario 'user can post a message' do
    visit '/new'
    fill_in 'body', with: 'test message'
    fill_in 'username', with: 'testusername'
    fill_in 'name', with: 'testname'
    click_button 'Send'
    expect(page).to have_content 'test message'
    expect(page).to have_content 'testusername'
    expect(page).to have_content 'testname'
  end
end