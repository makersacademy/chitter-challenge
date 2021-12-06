feature 'authentication' do 
  it 'a user can sign in' do 
    # Create a test user
    User.create(name: 'test', email: 'test@example.com', password: 'password123')

    # Then sign in as them 
    visit 'sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Login')

    expect(page).to have_content 'Welcome'
  end
end