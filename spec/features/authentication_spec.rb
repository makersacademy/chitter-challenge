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
end
