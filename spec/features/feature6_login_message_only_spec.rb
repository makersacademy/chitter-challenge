feature 'Only users can message' do
  before(:each) do
    login_to_twat
  end
  scenario 'A logged in user can post a message and see name in msg' do
    fill_in('new_message', with: 'Hello Twatters')
    click_button('Send')
    # expect(page).to have_content('JackIsCool') #todo
  end
  scenario 'A non logged in user cannot post a msg' do
    click_button('Logout')
    fill_in('new_message', with: 'Hello Twatters')
    click_button('Send')
    expect(page).to have_content('must be logged in to twat')
  end
end
