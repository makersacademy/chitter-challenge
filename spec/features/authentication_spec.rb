feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    visit ('/sessions/new')
    fill_in(:email, with:'test@email.com')
    fill_in(:password, with: 'Test Password')
    click_button('Sign In')

    expect(page).to have_content 'Welcome, test@email.com'
  end
end 
