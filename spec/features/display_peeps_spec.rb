feature "Displaying peeps" do
  scenario "a user can see a peep" do
    Peep.create(content: "just setting up my chttr")
    visit('/peeps')
    expect(page).to have_content "just setting up my chttr"
  end
end
