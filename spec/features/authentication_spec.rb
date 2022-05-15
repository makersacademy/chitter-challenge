feature 'Authentication' do
  scenario 'user successfully logs in' do
    User.create('test@gmail.com', 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'

    expect(page).to have_content "Welcome, test@gmail.com!"
  end
end