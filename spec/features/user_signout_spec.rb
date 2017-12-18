feature 'User Signout' do

  scenario 'a user can sign out of the chat' do
    signup
    expect(page).to have_button 'Sign Out?'
  end

  scenario 'a signed out user is no longer signed in' do
    signup
    signin
    click_on 'Sign Out?'
    visit '/chat'
    expect(page).to_not have_content 'Signed in as JBloggy'
  end
end
