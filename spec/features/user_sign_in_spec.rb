feature 'Signing in' do
  scenario 'user is able to sign in to account' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    visit '/sessions/new'
    fill_in 'username', with: 'edlowther'
    fill_in 'password', with: 'very hard to guess word'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome to Chitter, Ed Lowther'
  end
  scenario 'user sign fails with bad credentials' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    visit '/sessions/new'
    fill_in 'username', with: 'edlowther'
    fill_in 'password', with: 'not very hard to guess word'
    click_button 'Sign in'
    expect(page).to have_content 'Username and/or password do not match our records'
  end
end
