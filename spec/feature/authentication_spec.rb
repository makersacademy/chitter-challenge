feature 'authentication' do
  it 'a user can log in' do
    user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')
    expect(page).to have_content 'Welcome, John'
  end
end
