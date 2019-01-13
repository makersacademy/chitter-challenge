feature "Peep History is visible" do
  scenario "A Maker can see their first posted peep" do
    createpeep
    expect(page).to have_content("Hello, world")
  end

  scenario "A Maker is able to see a history of peeps" do
    createpeep
    createsecondpeep
    expect(page).to have_content("Hello, world")
    expect(page).to have_content("Hello again, world")
  end
end
