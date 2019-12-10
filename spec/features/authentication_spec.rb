feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@test.com', password: 'password', handle: 'test')

    visit '/sessions/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password')
    click_button('Sign in')
    visit '/peeps'
    expect(page).to have_content 'Welcome to Chitter test'
  end
end
