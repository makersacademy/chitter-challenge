feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(name: 'Eve Moneypenny', username: 'moneypenny', password: 'pennyword', email: 'secretary@mi6.com')
    visit('/sessions/new')
    fill_in(:email, with: 'secretary@mi6.com')
    fill_in(:password, with: 'pennyword')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, Eve Moneypenny'
  end

  scenario 'a user sees an error message if email doesn\'t exist' do
    User.create(name: 'Eve Moneypenny', username: 'moneypenny', password: 'pennyword', email: 'secretary@mi6.com')
    visit('/sessions/new')
    fill_in(:email, with: 'treasurer@mi6.com')
    fill_in(:password, with: 'pennyword')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, Eve Moneypenny'
    expect(page).to have_content 'Please check your email or password'
  end
end
