feature 'log in and out' do
  scenario 'a user can log in to chitter' do
    add_user
    visit('/')
    click_link('Sign In')
    fill_in('username', with: 'Testy')
    fill_in('password', with: 'testing123')
    click_button('log_in')
    expect(page).to have_content "Welcome, Testy"
  end

  scenario 'a user can log out of chitter' do
    add_user
    visit('/')
    click_link('Sign In')
    fill_in('username', with: 'Testy')
    fill_in('password', with: 'testing123')
    click_button('log_in')
    click_link('Sign Out')
    expect(page).to have_content "You are logged out!"
  end
end
