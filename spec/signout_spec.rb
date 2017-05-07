feature 'signing out' do
 it 'allows the user to sign out' do
 sign_up
 visit '/signin'
 fill_in :username, with: 'Reshma123'
 fill_in :password, with: 'password'
 click_button 'Sign in'
 click_button 'Sign out'
 expect(page).to have_content('さようなら!')
 expect(page).not_to have_content('Welcome to Chitter, reshma@test.com')
end
end
