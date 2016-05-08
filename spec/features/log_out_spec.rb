feature 'user can log out' do

  before(:each) do
    create_user_alice
    log_in(email:'alice@example.com', password: 'orange')
  end

  scenario 'user can log out of current session' do
    click_button 'Log out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Alice')
  end

end