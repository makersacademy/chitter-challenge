

feature "user accounts" do

  scenario "user signs up" do
    sign_up
    expect(User.count).to eq(1)
  end

  scenario "password mismatch" do
    visit('/user/new')
    fill_in "name", with: "Jasper KH"
    fill_in "username", with: "JKH"
    fill_in "email", with: "j.kingharman@googlemail.com"
    fill_in "password", with: "fake"
    fill_in "password_confirmation", with: "f"
    click_on("Create Account")
    expect(page).to have_content("You have a password mismatch, try again")
  end

  scenario "missing email" do
    visit('/user/new')
    fill_in "name", with: "Jasper KH"
    fill_in "username", with: "JKH"
    fill_in "password", with: "fake"
    fill_in "password_confirmation", with: "fake"
    click_on("Create Account")
    expect(User.count).not_to eq(1)
  end

=begin
  scenario "missing password" do
    visit('/user/new')
    fill_in "name", with: "Jasper KH"
    fill_in "username", with: "JKH"
    fill_in "email", with: "j.kingharman@googlemail.com"
    click_on("Create Account")
    expect(page).to have
  end
=end

  scenario "missing names" do
    visit('/user/new')
    fill_in "email", with: "j.kingharman@googlemail.com"
    fill_in "password", with: "fake"
    fill_in "password_confirmation", with: "fake"
    click_on("Create Account")
    expect(User.count).not_to eq(1)
  end


end
