feature "Chitter Homepage" do
  feature "News feed" do
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
      Peep.create(text: "Test Peep2", created_at: Time.at(628_232_400))
      visit "/chitter"
      expect(first('.peep')).to have_content "Test Peep2 peeped on 28/11/1989 at 05:00AM"
    end
  end

  feature "Peep button" do
    scenario "takes you to new peep form" do
      visit "/chitter"
      click_button "New Peep"
      expect(current_path).to eq "/chitter/peep"
    end
  end
end
