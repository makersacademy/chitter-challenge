feature 'authentication' do
  it 'a user can sign in' do
    Users.sign_up(username: 'TheTestPeeper', firstname: 'Test', secondname: 'Smith', email: 'test@example.com', password: 'password123')

    visit '/sign-in'
    fill_in('username', with: 'TheTestPeeper')
    fill_in('password', with: 'password123')
    click_button('Sign In')

    expect(page).to have_content 'Hello TheTestPeeper'
  end
end
