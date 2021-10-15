feature "Posting a peep message" do
  scenario "post and view a peep" do
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("INSERT INTO peeps VALUES (1,'First peep!');")
    connection.exec("INSERT INTO peeps VALUES (2,'Another peep!');")

    visit("/chitter")
    # fill_in("peep", with: "First peep!")
    # click_button("Send")

    expect(page).to have_content "First peep!"
  end
end
