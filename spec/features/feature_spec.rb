# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "/" do
  scenario "finds \"Chitter\" on homepage" do
    visit '/'
    expect(page).to have_content("Chitter")
  end

  scenario "clicking log in takes user to log in page" do
    visit '/'
    click_button("Log in")
    expect(current_path).to eq('/login')
  end

end
