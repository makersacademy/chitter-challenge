feature "Peep History is visible" do
  scenario "A Maker can see previously posted peeps" do
    createpeep
    expect(page).to have_content("Hello, world")
  end
end
