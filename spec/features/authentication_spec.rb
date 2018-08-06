feature 'authentication' do
  it 'allows a user to sign in' do
    New_user.create(username: 'bossmansteph', email: 'stephanie@bossmanenterprises.com', password: 'saynuttin')
    # Then sign in as them
    visit '/sessions/new'
    fill_in(:username, with: 'bossmansteph')
    fill_in(:password, with: 'saynuttin')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, bossmansteph'
  end

  it 'a user can sign out' do
   # Create the user
    New_user.create(username: 'bossmansteph', email: 'stephanie@bossmanenterprises.com', password: 'saynuttin')
    fill_in(:username, with: 'bossmansteph')
    fill_in(:password, with: 'saynuttin')
    click_button('Sign in')
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, bossmansteph'
    expect(page).to have_content 'You have signed out.'
  end

end
