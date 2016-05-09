feature 'Signing up' do
   scenario 'User can sign up' do
     visit '/users/new'
     expect(page.status_code).to eq(200)
     expect { sign_up }.to change(User, :count).by 1
     expect(page).to have_content('Hello, Donald Trump')
     expect(User.first.email).to eq('don123@gmail.com')
   end

   scenario 'Requires a matching confirmation password' do
     expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
     expect(current_path).to eq ('/users')
     expect(page).to have_content 'Password does not match the confirmation'
   end

   scenario "User can't sign up without an email address" do
     visit '/users/new'
     expect(page.status_code).to eq(200)
     fill_in :name, with: 'Donald Trump'
     fill_in :username, with: 'don123'
     fill_in :password, with: '123456'
     fill_in :password_confirmation, with: '123456'
     click_button 'Sign up!'
     expect(page).to have_content('Email must not be blank')
end

   scenario "User can't sign up without a valid email address" do
     visit '/users/new'
expect(page.status_code).to eq(200)
     fill_in :name, with: 'Donald Trump'
fill_in :username, with: 'don123'
     fill_in :email, with: 'don123@gmailcom'
     fill_in :password, with: '123456'
     fill_in :password_confirmation, with: '123456'
     click_button 'Sign up!'
     expect(page).to have_content("Doesn't look like an email address to me")
   end

scenario "Can't sign up if email already exists" do
     sign_up
     sign_up(name: 'Bill Trump',
username: 'bill123',
             password: '123',
             password_confirmation: '123')
     expect(page).to have_content "Email is already taken"
   end

     scenario "Can't sign up if username already exists" do
     sign_up
     sign_up(name: 'Bill Trump',
             email: 'bill123@gmail.com',
password: '123',
             password_confirmation: '123')
     expect(page).to have_content "Username is already taken"
   end
 end
