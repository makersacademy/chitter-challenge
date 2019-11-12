require "./app"

feature "Viewing Chitter" do
  scenario "user can visit the Chitter homepage" do
    visit("/")
    expect(page).to have_content "CHITTER"
  end

  scenario "user can view 'Peeps' on Chitter" do
    Peep.create(peep: "This is a test Peep! Peep Peep Peep!")
    Peep.create(peep: "This is a second, even longer, test Peep! Peep Peep Peep!")
    visit("/homepage")
    expect(page).to have_content "This is a test Peep! Peep Peep Peep!"
    expect(page).to have_content "This is a second, even longer, test Peep! Peep Peep Peep!"
  end
end
