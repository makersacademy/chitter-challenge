feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'peeping@peepers.com', password: 'SuperSecretPassword123')

    visit '/sessions/new'
    fill_in(:email, with: 'peeping@peepers.com')
    fill_in(:password, with: 'SuperSecretPassword123')
    click_button('Sign in')

    expect(page).to have_content "Get Peeping, peeping@peepers.com"
  end
end