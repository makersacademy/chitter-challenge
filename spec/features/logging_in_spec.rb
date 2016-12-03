feature "Logging in:" do

  before do
    created_user = User.create(email: "fly@high.com", pass: "bowling1234", name: "The Dude", username: "thedude")
  end

  scenario "user logs in with a valid account" do

    visit '/users/login'
    fill_in("username", with:"thedude")
    fill_in("password", with:"bowling1234")
    click_button("Submit")

    expect(current_path).to eq '/peeps'

  end

end
