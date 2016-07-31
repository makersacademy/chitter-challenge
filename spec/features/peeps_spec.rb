feature "postin peeps" do
  scenario "user can post peeps" do
    sign_in
    fill_in "peep", with: "That was a looooong day"
    click_button "Peep"
    expect(page).to have_content "Ben09: That was a looooong day"
  end
end

feature "viewing peeps" do
  scenario "peeps are displayed in reverse chronological order" do
    sign_in
    Peep.create(content: "Anything new")
    Peep.create(content: "Anything new 2")
  end
end
