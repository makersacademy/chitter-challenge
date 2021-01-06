feature "Add Peep" do
  scenario "it adds a single peep to /peeps page" do
    sign_up("adam")
    add_peep1
    expect(page).to have_content("my first peep")
  end

  scenario "it adds multiple peeps to /peeps page" do
    sign_up("adam")
    add_peep1
    click_link("Back to homepage")
    click_link("Add Peep")
    fill_in("peep_content", with: "my second peep")
    click_button("Peep")
    expect(page).to have_content("my first peep")
    expect(page).to have_content("my second peep")
  end

end
