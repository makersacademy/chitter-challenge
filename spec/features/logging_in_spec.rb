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

    visit '/sessions/new'
    fill_in("username", with:"thedude")
    fill_in("password", with:"bowling1234")
    click_button("Submit")

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to chitter thedude'

  end

end
