feature "Index page" do
  scenario "I am redirected to the peeps feed when currently signed in" do
    sign_up
    visit("/")
    expect(current_path).to eq("/peeps")
  end

  scenario "I can go to sign up" do
    visit("/")
    click_button("Sign up for Chitter")
    expect(current_path).to eq("/users/new")
  end
end
