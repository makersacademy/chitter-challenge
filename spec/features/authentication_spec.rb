feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(
      email: 'peeping@peepers.com',
      password: 'SuperSecretPassword123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'peeping@peepers.com')
    fill_in(:password, with: 'SuperSecretPassword123')
    click_button('Sign in')

    expect(page).to have_content "Get Peeping, peeping@peepers.com"
  end

  scenario 'a user sees an error if they give the wrong email' do
    User.create(
      email: 'peeping@peepers.com',
      password: 'SuperSecretPassword123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'wrong@email.com')
    fill_in(:password, with: 'SuperSecretPassword123')
    click_button('Sign in')

    expect(page).not_to have_content "Get Peeping, peeping@peepers.com"
    expect(page).to have_content "Wrong email/password"
  end

  scenario 'a user can sign out' do
    User.create(
      email: 'peeping@peepers.com',
      password: 'SuperSecretPassword123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'peeping@peepers.com')
    fill_in(:password, with: 'SuperSecretPassword123')
    click_button('Sign in')

    click_button('Log out')

    expect(page).not_to have_content "Get Peeping, peeping@peepers.com"
    expect(page).to have_content "Chitter, home of the peeps\nYou have logged out"
  end
end
