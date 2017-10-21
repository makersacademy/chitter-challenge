feature 'Signing in' do
  scenario 'user is able to sign in to account' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    sign_in 'edlowther', 'very hard to guess word'
    expect(page).to have_content 'Welcome to Chitter, Ed Lowther'
  end
  scenario 'user sign in fails with bad credentials' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    sign_in 'edlowther', 'not very hard to guess word'
    expect(page).to have_content 'Username and/or password do not match our records'
  end
end
