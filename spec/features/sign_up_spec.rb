feature "sign up" do
  scenario "user can sign up" do
    visit "/signup"
    fill_in "user_name", with: "predator911"
    fill_in "name", with: "Jon Doe"
    fill_in "password", with: "callth3cops"
    fill_in "email", with: "prodator911@mail.com"
    click_button "Sign up"

    expect(page).to have_content "Hello Jon Doe"
  end
end
