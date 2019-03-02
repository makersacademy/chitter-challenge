feature 'Logging out' do
  scenario 'user is logged-out' do

    sign_up_for_chitter
    
    log_in_to_chitter

    expect(page).to have_content 'testuser'
    click_button 'Log out!'

    # log out
    visit '/peeps'
    expect(page).to_not have_content 'Hello, testuser'
  end
end
