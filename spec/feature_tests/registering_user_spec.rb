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
  scenario "Users are greeted when they have signed in" do
    register_user
    expect(page).to have_content "Welcome Test!"
  end
  scenario "User can't register is confirmation password is incorrect" do
    expect{register_user("wrong_password")}.not_to change(User, :count )
    expect(current_path).to eq('/register_user')
    expect(page).to have_content 'Your passwords do not match, please try again'
  end
  scenario "User can sign out" do
    register_user
    click_button "sign out"
    expect(page).not_to have_content "Welcome Test!"
  end
  # scenario "User can't register duplicated information" do
  #   register_user
  #   expect { register_user }.to_not change(User, :count)
  #   expect(page).to have_content('Email/username is already taken')
  # end
end
