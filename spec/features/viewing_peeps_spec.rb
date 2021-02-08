feature "viewing all peeps" do
  scenario "wanting to see all the peeps" do
    DatabaseConnection.query("INSERT INTO peeps (peep_content) VALUES ('This is a peep!');")
    DatabaseConnection.query("INSERT INTO peeps (peep_content) VALUES ('This is another peep!');")
    DatabaseConnection.query("INSERT INTO peeps (peep_content) VALUES ('This, too, remarkably, is a peep!');")

    visit('/peeps')
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is another peep!"
    expect(page).to have_content "This, too, remarkably, is a peep!"
  end
end