

 feature "User Creation" do
   
  scenario "User with wrong confirmation password cannot sign up" do
    expect{ sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end
  
  scenario "User needs to confirm password to sign up" do
    expect{ sign_up(password_confirmation: "sup£rs3cret") }.to change(User, :count)
  end
  
  scenario "User cannot sign up with invalid email address" do
    sign_up(email: nil)
    expect(page).not_to have_content "Me signed up successfully!"
  end
  
  scenario "User cannot sign up with duplicate email address" do
    sign_up
    sign_up
    expect(page).to have_content "Email is already taken"
  end
 end
 
 feature 'User Sign in' do
   
   scenario "User can sign in with the right credentials" do
     sign_up
     expect(page).to have_field "email"
     sign_in
     expect(page).to have_content "Welcome to Chitter!"
     
   end
 end
 
 feature "User Sign Out" do
   
   scenario "User can sign out and is redirected to the main page" do
     sign_up
     sign_in
     sign_out
     expect(page).to have_content "Goodbye!"
     expect(page).not_to have_content "Signed in as - "
   end
 end
 
 
 
 