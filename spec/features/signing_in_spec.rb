feature 'Signing in' do
   scenario 'A user can sign in' do
     sign_up
     sign_in
     expect(page).to have_content 'Hello, Donald Trump'
   end

   scenario "Can't sign in with wrong password" do
     sign_up
     sign_in_with_wrong_password
     expect(page).to have_content 'Wrong password. Please try again.'
   end
 end
