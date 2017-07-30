# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature "Signing in" do
  let!(:user) do
    User.create(username: "penfold", email: "hamster@dmhideout.com",
                password: "crumbs", password_confirmation: "crumbs")
  end

  scenario "I want to sign in to Chitter" do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome to Chitter #{user.username}"
  end

  scenario "I can't sign in with the wrong password" do
    sign_in(username: user.username, password: "ohheck")
    expect(current_path).to eq("/sessions")
    expect(page).to have_content "The username or password is incorrect"
  end
end
