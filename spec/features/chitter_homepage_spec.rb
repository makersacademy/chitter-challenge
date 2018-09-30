
feature "News feed on Chitter Homepage" do
  scenario "should dislplay peeps" do
    Peep.create(text: "Test Peep1")
    visit "/chitter"
    expect(page).to have_content "Test Peep1"
  end

  scenario "should dislplay peeps" do
    Peep.create(text: "Test Peep1")
    Peep.create(text: "Test Peep2")
    visit "/chitter"
    expect(first('.peep')).to have_content "Test Peep2"
  end
end
