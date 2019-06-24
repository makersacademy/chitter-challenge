feature ' ## Authentication' do
  scenario 'User signs in' do 
   # Create a test user
   User.register('Remy', 'testEmail@gmail.com', 'Remzilla', 'password1')

   visit '/sessions'
   fill_in("username", with: 'Remzilla')
   fill_in(:password, with: 'password1')
   click_button('Sign in')
   expect(page).to have_content 'logged in as: Remzilla'
  end
end