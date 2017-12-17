feature 'User can post messages on Chitter as himself/herself' do
  scenario 'I can sign in with a username' do
     sign_up
     expect(page).to have_content 'Welcome to Chitter, the best replacement to Twitter'
     expect(page).to have_content 'You are signed in as Nikolaos'
   end

end
