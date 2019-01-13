feature "Peep submission" do
  scenario "A Maker can post a peep" do
    visit "/"
    fill_in :peep, with: "Hello, world"
    click_button "Submit"
  end
end
