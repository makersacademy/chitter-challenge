 feature 'sign up' do
   scenario 'first page that loads is sign up and then the associated form renders' do
     visit ('/')
     expect(page).to have_content 'Sign up'
   end

   scenario 'upon signing up, users username appears on peep_home' do
     sign_up
     expect(page).to have_content 'Hello, Alex Ample'
   end
 end
