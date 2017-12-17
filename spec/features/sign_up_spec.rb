 feature 'sign up' do
   scenario 'first page that loads is sign up and then the associated form renders' do
     visit ('/')
     expect(page).to have_content 'Sign up'
   end

   scenario 'upon signing up, users username appears on peep_home' do
     visit('/')
     fill_in 'username', with: 'Alex Ample'
     fill_in 'email_address', with: 'a@b.com'
     fill_in 'password', with: ';kdafj'
     click_button 'Sign up'
     expect(page).to have_content 'Hello, Alex Ample'
   end
 end
