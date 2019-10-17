feature 'authentication' do
  it 'a user can sign in' do
    User.create(user_name: 'Test', email: 'test@example.com', password: 'password123')

    visit '/new_session'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome to your Chitterfeed, Test!'
  end
end