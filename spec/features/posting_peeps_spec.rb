feature "Posting peeps:" do

  let!(:user) do
    User.create(
    email: "hello@goodbye.com",
    password: "averystrongpassword",
    password_confirmation: "averystrongpassword",
    name: "Bob Marley",
    username: "bob"
    )
  end

  scenario "user is logged in and posts a peep" do
    log_in(username: "bob", password: "averystrongpassword")
    expect{ peep }.to change(Peep, :count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Thank you, your peep has been posted.")
  end

  scenario "User is not logged in. Should not see new peep entry field." do
    visit '/peeps'
    expect(page).not_to have_content("New Peep")
  end


end
