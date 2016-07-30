feature "postin peeps" do
  scenario "user can post peep" do
    sign_in
    fill_in "peep", with: "That was a looooong day"
    click_button "Peep"
    expect(page).to have_content "Ben09: That was a looooong day"
  end
end
