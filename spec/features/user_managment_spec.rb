

 feature "User Managment" do
   
  scenario "User with wrong confirmation password cannot sign up" do
    sign_up_wrong
    expect{ sign_up_wrong(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password confirmation does not match"
  end
  
  scenario "User needs to confirm password to sign up" do
    sign_up
    expect{ sign_up(password_confirmation: 'wrong') }.to change(User, :count)
  end
  
  scenario "User cannot sign up with invalid email address" do
    sign_up_wrong_email
    expect(page).not_to have_content "Welcome, Smoodge"
  end
 end
 
 