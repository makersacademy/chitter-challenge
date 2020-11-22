feature 'authentication' do
  it 'a user can sign in' do
    Profile.create(email: 'mario@mario.com', password: 'mario', name: 'Mario Mario', username: 'Mario123')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'mario')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, Mario Mario'
  end
end
