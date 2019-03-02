feature 'creating accounts' do
  scenario 'an account is created for the new user' do
    
    visit '/accounts/new'
    fill_in :email, with: 'user@example.com'
    fill_in :name, with: 'Test User'
    fill_in :username, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign-up!'

    expect(page).to have_content 'Hello, user@example.com'
  end
end
