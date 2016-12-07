feature 'User log out' do
  before(:each) do
    User.create(username: 'test',
                name: 'Testy Smith',
                email: 'test@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'while logged in' do
    log_in(username: 'test', password: 'secret1234')
    click_button 'Log out'
    expect(page).to have_content('Goodbye!')
    expect(page).to_not have_content('Welcome, test')
  end

end
