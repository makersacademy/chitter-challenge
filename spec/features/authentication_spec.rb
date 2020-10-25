feature 'authentication' do
  it 'a user can sign in' do

    Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, rubberduck'
  end

    scenario 'a user can sign out' do
      Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')

      visit '/sessions/new'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      click_button('Sign in')

      click_button('Sign out')

      expect(page).not_to have_content 'Welcome, rubberduck'
    end
end
