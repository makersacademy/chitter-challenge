

 feature "User Managment" do
   scenario "User can sign up" do
     expect{ sign_up }.to change(User, :count).by(1)
     expect(page).to have_content 'Welcome, Smoodge'
     expect(User.last.email).to eq "example@ymail.com"
   end
 end