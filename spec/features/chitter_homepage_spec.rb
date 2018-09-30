feature "Chitter Homepage" do
  feature "News feed" do
    scenario "should dislplay peeps" do
      Peep.create(text: "Test Peep1")
      visit "/peeps"
      expect(page).to have_content "Test Peep1"
    end

    scenario "should dislplay peeps" do
      Peep.create(text: "Test Peep1")
      Peep.create(text: "Test Peep2")
      visit "/peeps"
      expect(first('.peep')).to have_content "Test Peep2"
    end

    scenario "should dislplay peeps" do
      Peep.create(text: "Test Peep1", created_at: Time.now)
      Peep.create(text: "Test Peep2", created_at: Time.at(628_232_400))
      visit "/peeps"
      expect(first('.peep')).to have_content "Test Peep2 peeped on 28/11/1989 at 05:00AM"
    end
  end

  feature "Peep button" do
    scenario "takes you to new peep form" do
      visit "/peeps"
      click_button "New Peep"
      expect(current_path).to eq "/peeps/new"
    end
  end

  feature "Sign Up button" do
    scenario "takes you to sign up page" do
      visit "/peeps"
      click_button "Sign Up"
      expect(current_path).to eq "/users/new"
    end
  end
end
