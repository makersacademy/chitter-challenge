feature "Viewing peeps in reverse chronological order" do
  scenario "viewing peeps in reverse order" do
    Peep.create(text: "First peep!")
    Peep.create(text: "Second peep!")
    Peep.create(text: "Third peep!")
    visit("/chitter")

    expect(page).to have_content "Third peep! Second peep! First peep!"
    expect(page).not_to have_content "First peep! Second peep! Third peep!"
  end
end
