feature "Posting a peep message" do
  scenario "post and view a peep" do
    Peep.create(text: "First peep!")
    visit("/chitter")
    fill_in("peep", with: "First peep!")
    click_button("Send")

    expect(page).to have_content "First peep!"
  end
end
