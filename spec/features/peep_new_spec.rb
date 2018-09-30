feature "add new peep" do
  it "Adds a new peep" do
    visit "/home"
    click_button "add"
    fill_in "peep", with: "Hungry"
    click_button "Submit"
    expect(page).to have_content "Hungry"
  end
end
