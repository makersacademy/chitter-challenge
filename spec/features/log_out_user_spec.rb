feature 'Logging out' do
  scenario 'user is logged-out' do

    # sign-up first
    visit '/accounts/new'
    fill_in :email, with: 'user@example.com'
    fill_in :name, with: 'Test User'
    fill_in :username, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign-up!'
    
    # log in
    visit '/accounts/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: '123456'
    click_button 'Log-in!'

    expect(page).to have_content 'testuser'
    click_button 'Log out!'

    # log out
    visit '/peeps'
    expect(page).to_not have_content 'testuser'
  end
end
