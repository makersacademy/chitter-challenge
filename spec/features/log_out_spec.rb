feature 'User logs out' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'password',
                password_confirmation: 'password',
                name: 'test',
                username: 'test')
  end

  scenario 'while being logged in' do
    log_in(email: 'test@test.com', password: 'test')
    click_button 'Log out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('test')
  end
end
