feature 'User Logout' do

  scenario 'a user can log out of the chat' do
    visit '/chat'
    expect(page).to have_button 'Log Out?'
  end

  scenario 'a logged out user is no longer logged in' do
    signup
    login
    click_on 'Log Out?'
    visit '/chat'
    expect(page).to_not have_content 'Signed in as JBloggy'
  end
end
