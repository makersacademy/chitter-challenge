
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

  scenario "should dislplay peeps" do
    Peep.create(text: "Test Peep1", created_at: Time.now)
    Peep.create(text: "Test Peep2", created_at: Time.at(628232400))
    visit "/chitter"
    expect(first('.peep')).to have_content "Test Peep2 peeped on 28/11/1989 at 05:00AM"
  end
end

(Time.at(628232400)).strftime("%d/%m/%Y at %I:%M%p")
