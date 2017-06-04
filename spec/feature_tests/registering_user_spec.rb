require_relative "web_helpers"

feature "Registering a new user" do
  scenario "Users can visit the register page" do
    visit "/"
    click_button "Register New User"
    expect(page).to have_content "Please enter user details:"
  end
  scenario "After filling out a completing signup form a user account is created" do
    expect{register_user}.to change(User, :count )
    expect(page).to have_content "Welcome Test!"
  end
  scenario "User can't register if confirmation password is incorrect" do
    expect{register_user("wrong_password")}.not_to change(User, :count )
    expect(current_path).to eq('/register_user')
    expect(page).to have_content 'Your passwords do not match, please try again'
  end
  scenario "User can sign out" do
    sign_in
    click_button "sign out"
    expect(page).not_to have_content "Welcome Test!"
  end
  scenario "User can sign in" do
    sign_in
    click_button "sign out"
    sign_in
    expect(page).to have_content "Welcome Test!"
  end
  scenario "User gets an error if they try to use the wrong password" do
    sign_in
    click_button "sign out"
    sign_in("wrong_password")
    expect(page).to have_content "The email or password is incorrect"
  end
  scenario "User can't register duplicated information" do
    expect { register_user }.to_not change(User, :count)
  end
end
