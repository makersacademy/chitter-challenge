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

  scenario "user is signed in and posts a peep" do
    expect{ peep }.to change(Peep, :count).by(1)
    expect(current_path).to eq '/peeps'
    expect(page).to have_content("Thank you, your peep has been posted.")
  end

  def peep
    log_in(username: "bob", password: "averystrongpassword")
    fill_in('new_peep', with: "ROFLCOPTER")
    click_button('Peep')
  end


end
