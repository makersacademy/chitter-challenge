
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature "post peeps" do
  scenario "see peeps" do
    visit "/"
    expect(page).to have_content("Chitter:")
  end

  scenario "add peeps" do
    visit("/peeps")
    fill_in("peeps", with: "First peep")
    click_button("Submit")
    expect(page).to have_content "First peep"
  end
end
