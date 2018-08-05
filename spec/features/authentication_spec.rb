feature 'authentication' do
  it 'a user can sign in' do
    visit '/sessions/new'
    fill_in(:email, with: 'test3@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log-in')

    expect(page).to have_content 'Welcome, test3'
  end
end
