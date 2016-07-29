feature "Sign-up" do
  scenario "enters email and password" do
    visit '/user/new'
    fill_in :name, with: 'Robert Summers'
    fill_in :email, with: 'asdf@asdf.com'
    fill_in :callsign, with: 'Rob-rls'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    expect{ click_button "Sign Up" }.to change{ User.count }.by(1)
  end
end
