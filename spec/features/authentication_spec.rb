feature 'authentication' do
  it 'allows users to sign in' do
    User.create(handle: 'tester', email: 'test@email.com', password: 'password123', name: 'Mr Test')

    visit '/sessions/new'
    fill_in :email, with: 'test@email.com'
    fill_in :password, with: 'password123'

    click_button 'Sign in'

    expect(page).to have_content 'Hello @tester'
  end
end