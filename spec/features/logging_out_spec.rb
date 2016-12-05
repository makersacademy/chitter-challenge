feature "Logging out:" do

  let!(:user) do
    User.create(
      email: "wow@verywow.com",
      password: "much_wow",
      password_confirmation: "much_wow",
      name: "Very Talent",
      username: "doge"
      )
  end

  scenario "User is logged in. User has had enough of humanity. They log out." do
    log_in(
      username: user.username,
      password: user.password
    )
    expect(current_path).to eq '/peeps'
    click_button("Log out")
    expect(page).to have_content("Log out successful. See you soon!")
    expect(page).not_to have_content("Welcome to chitter #{user.username}")
  end


end
