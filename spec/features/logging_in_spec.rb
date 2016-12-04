feature "Logging in:" do

  let!(:user) do
    User.create(
      email: "fly@high.com",
      password: "bowling1234",
      password_confirmation: "bowling1234",
      name: "The Dude",
      username: "thedude"
      )
  end

  scenario "user logs in with a valid account" do
    log_in(user.username, user.password)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome to chitter #{user.username}"
  end

  scenario "user logs in with invalid account" do
    log_in("donny", user.password)
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'Errors:'
  end

end
