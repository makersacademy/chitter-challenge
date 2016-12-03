feature "Password Confirmation" do
  scenario "User must enter a password" do
    expect{no_password_sign_up}.to change{User.count}.by 0
    expect(current_path).to eq ('/users')
    expect(page).to have_content("You must enter a password!")
  end

  scenario "Password and confirmation must match" do
    expect{wrong_password_confirmation}.to change{User.count}.by 0
    expect(current_path).to eq ('/users')
    expect(page).to have_content("The password and confirmation password must match!")
  end
end
