feature "Viewing posted peeps" do
  scenario "User can see all peeps" do
    visit("/")
    expect(page).to have_content("This is my first ever peep!")
    expect(page).to have_content("This is my second peep!")
    expect(page).to have_content("This is my third peep!")
  end
end
