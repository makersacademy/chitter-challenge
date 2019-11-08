require "./app"

feature "Viewing Chitter" do
  scenario "user can visit the Chitter homepage" do
    visit("/")
    expect(page).to have_content "CHITTER"
  end

  scenario "user can view 'Peeps' on Chitter" do
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("INSERT INTO peeps (peep) VALUES ('This is a test Peep! Peep Peep Peep!');")
    connection.exec("INSERT INTO peeps (peep) VALUES('This is a second, even longer, test Peep! Peep Peep Peep!');")
    visit("/homepage")
    expect(page).to have_content "This is a test Peep! Peep Peep Peep!"
    expect(page).to have_content "This is a second, even longer, test Peep! Peep Peep Peep!"
  end
end
