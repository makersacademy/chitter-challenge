feature 'FEATURE: signing up' do
  scenario 'User can sign up for account' do
    visit '/users/new'
    fill_in :name, with: 'Bob'
    fill_in :username, with: 'Bobby'
    fill_in :email, with: 'Bob@bob.org'
    fill_in :password, with: '12345'
    fill_in :password_confirmation, with: '12345'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! A new user account has been created for Bobby'
  end
end
