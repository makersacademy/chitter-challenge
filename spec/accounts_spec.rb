feature "New user sign up" do

  scenario "button leads to register page" do
    click_button("Sign up")
    expect(page).to have_content("Please complete the form to sign up")
  end

  scenario "increases user count by one" do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  xscenario "passwords are saved as a hash" do

  end



end
