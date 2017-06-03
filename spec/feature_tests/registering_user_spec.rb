require_relative "web_helpers"

feature "Registering a new user" do
  scenario "Users can visit the register page" do
    visit "/"
    click_button "Register New User"
    expect(page).to have_content "Please enter user details:"
  end
  scenario "After filling out a completing signup form a user account is created" do
    expect{register_user}.to change(User, :count )
  end
end
