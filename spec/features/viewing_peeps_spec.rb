require 'pg'

feature "View all peeps" do 
  scenario "A user can see all the peeps" do 
    conn = PG.connect(dbname: 'chitter_test')

    # Add test data
    conn.exec("INSERT INTO peeps (message) VALUES ('Test Example peep 1');")
    conn.exec("INSERT INTO peeps (message) VALUES ('Test Example peep 2');")
    conn.exec("INSERT INTO peeps (message) VALUES ('Test Example peep 3');")

    visit('/chitter')

    expect(page).to have_content("Test Example peep 1")
    expect(page).to have_content("Test Example peep 2")
    expect(page).to have_content("Test Example peep 3")
  end 
end 