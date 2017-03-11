# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "/" do
  scenario "accesses home page and finds \"Chitter\"" do
    visit '/'
    expect(page).to have_content("Chitter")
  end

  scenario "enters all sign up information" do
    visit '/'
    fill_in :full_name,     with: "Noo Userson"
    fill_in :user_name,     with: "Noobie"
    fill_in :email,         with: "new@user.com"
    fill_in :password,      with: "secret_password"
    fill_in :password_confirmation,  with: "secret_password"
    click_button('Sign Up')
    expect(current_path).to eq('/peeps')
  end

end
