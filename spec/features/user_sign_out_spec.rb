feature 'Signing out' do
  scenario 'user is able to sign out of account' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    sign_in 'edlowther', 'very hard to guess word'
    click_button 'Sign out'
    expect(page).to have_content 'See you next time!'
  end
end
