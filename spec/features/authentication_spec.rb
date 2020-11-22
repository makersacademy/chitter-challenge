feature 'authentication' do
  it 'a user can sign in' do
    Profile.create(email: 'mario@mario.com', password: 'mario', name: 'Mario Mario', username: 'Mario123')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'mario')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, Mario Mario'
  end

  it 'a user sees an error if they get their email wrong' do
    Profile.create(email: 'mario@mario.com', password: 'mario', name: 'Mario Mario', username: 'Mario123')
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, Mario Mario'
    expect(page).to have_content 'Please check your email or password.'
  end
end
