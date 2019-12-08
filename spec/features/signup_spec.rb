require "pg"

feature "signup" do
  scenario "page should prompt you to sign up" do
    visit "/signup"
    expect(page).to have_content("Signup and get started!!")
  end

  scenario "page should displays user name after signing up" do
    visit "/signup"
    fill_in :email, :with => "healankeena@gmail.com"
    fill_in :password, :with => "password"
    fill_in :username, :with => "keanheal"
    fill_in :name, :with => "heelan"
    click_on "signup"

    expect(page).to have_content("keanheal")
  end
end
