feature "Signing in" do
  scenario "providing the correct password allows the user to log in" do
    sign_up
    correct_log_in
    expect(current_path).to eq "/peeps"
    expect(page).to have_content("Welcome samuel@gmail.com")
  end

  scenario "providing the wrong password does not log the user in" do
    sign_up
    incorrect_log_in
    expect(current_path).to eq "/sessions/new"
    expect(page).to have_content("Please enter your password!")
  end
end
