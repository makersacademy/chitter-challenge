feature 'Sign in' do

 scenario 'Sign in button appears if not signed in already' do
   visit '/'
   expect(page).to have_button('Sign In')
 end

 scenario 'user signs in correctly and gets welcome message' do
   sign_in
   expect(page).to have_content('Welcome, JamesX')
 end

 scenario 'when signed in user has the ability to post peep' do
   sign_in
   expect(page).to have_button('New Peep!')
 end

 scenario 'if user is not registered they won\'t be signed in' do
   sign_in(email: 'wrong@wrong.com', password: '321')
   expect(page).to have_content('The email or password is incorrect')
 end

 scenario 'if user inputs wrong password they won\'t be signed in' do
   sign_in(password: '321')
   expect(page).to have_content('The email or password is incorrect')
 end

end
