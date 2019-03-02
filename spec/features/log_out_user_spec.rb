feature 'Logging out' do
  scenario 'user is logged-out' do

    sign_up_for_chitter
    
    # log in
    visit '/accounts/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: '123456'
    click_button 'Log-in!'

    expect(page).to have_content 'testuser'
    click_button 'Log out!'

    # log out
    visit '/peeps'
    expect(page).to_not have_content 'Hello, testuser'
  end
end
