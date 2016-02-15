feature 'signing out' do
   scenario 'User sign out' do
     sign_up
     sign_in
     sign_out
     expect(page).to have_content 'Goodbye, Donald Trump'
     expect(page).not_to have_content 'Welcome, Donald Trump'
   end
 end
