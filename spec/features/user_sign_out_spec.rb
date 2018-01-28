feature 'User signs out' do
  before do
    User.create(email: '123@123.com',
                password: 'password',
                password_confirmation: 'password',
                name: 'Bob',
                username: 'Alice')
  end

  scenario 'I want to log out of Chitter' do
    sign_in(email: '123@123.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Bob')
  end
end
