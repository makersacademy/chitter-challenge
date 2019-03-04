feature 'authentication' do
  it 'a user can sign in' do
    User.create(username: 'Anu', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'Anu')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Anu'
  end
end

feature 'authentication' do
  scenario 'a user sees an error if they get their username wrong' do
    User.create(username: 'Anu', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'nottherightusername')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, Anu

    expect(page).to have_content 'Please check your username or password.'

  end

end

feature 'authentication' do
  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'Anu', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'nottherightusername')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, 'Anu'
    expect(page).to have_content 'Please check your username or password.'

  end

end

feature 'authentication' do
  it 'a user can sign out' do
    User.create(username: 'Anu', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'Anu')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, 'Anu'

    expect(page).to have_content 'You have signed out.'
  end
end
