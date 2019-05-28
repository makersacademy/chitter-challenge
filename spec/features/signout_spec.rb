# feature 'user can log out' do
#   scenario "log out takes you back to the peep wall no longer signed in" do
#     visit('/users/new')
#     fill_in 'email', with: "peeper@chitter.com"
#     fill_in 'password', with: "password123"
#     fill_in 'name', with: "Chit Peeper"
#     fill_in 'username', with: "ChitPeep4eva"
#     click_button 'Join'
#     click_button 'Log Out'
#     expect(page).not_to have_content "Welcome, Chit Peeper"
#     expect(page).to have_button 'Sign Up'
#   end
# end
