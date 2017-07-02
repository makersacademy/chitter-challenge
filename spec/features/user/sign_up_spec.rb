

feature "user accounts" do

  scenario "user signs up" do
    sign_up
    expect(User.count).to eq(1)
  end

  scenario "user signs up incorrectly" do
    visit('/user/new')
    fill_in "email", with: "j.kingharman@googlemail.com"
    click_on("Create Account")
    expect(page).to have_content("Your input was invalid, try again.")
  end

end
