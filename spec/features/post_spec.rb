feature "post peep" do
  scenario "post a new peep using a form" do
    register
    visit "/peeps"
    fill_in "content", with: "New peep"
    click_on "Peep!"
    expect(page).to have_content("New peep")
  end
end
