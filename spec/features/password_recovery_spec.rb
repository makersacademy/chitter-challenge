feature "Password Recovery" do

  scenario "User can request to recover their password" do
    visit '/session/new'
    expect(page).to have_content ("Forgotten Password?")
  end

  scenario "Logs the time the user makes password recovery request" do
    visit '/session/new'
    click_link("Forgotten Password?")
    expect(current_path).to eq '/session/password-recovery'
    expect(page).to have_content ("Enter Email")
  end

end
