feature "Logging in:" do

  before do
    created_user = User.create(
    email: "fly@high.com",
    password: "bowling1234",
    password_confirmation: "bowling1234",
    name: "The Dude",
    username: "thedude"
    )
  end

  scenario "user logs in with a valid account" do
    log_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to chitter thedude'
  end

  def log_in(username: "thedude", password:"bowling1234")
    visit '/sessions/new'
    fill_in("username", with: username)
    fill_in("password", with: password)
    click_button("Submit")
  end

end
