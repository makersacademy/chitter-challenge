# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order (most recent first)

require 'pg'

feature "Viewing peeps" do
  scenario "user can see list" do
    visit "/peeps"
    expect(page).to have_selector "ul"
  end

  scenario "user can see list of peeps" do
    connection = PG.connect(dbname: 'chitter_test')

    # Add test data
    connection.exec("INSERT INTO peeps (message) VALUES ('Test peep');")
    
    visit "/peeps"
    expect(page).to have_content "Test peep"
  end

  scenario "user can see list of peeps with most recent first" do
    connection = PG.connect(dbname: 'chitter_test')

    # Add test data
    connection.exec("INSERT INTO peeps (message) VALUES ('Oldest peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Middle peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Newest peep');")

    visit "/peeps"
    first_child = find("ul li:first-child")
    expect(first_child).to have_content "Newest peep"
  end
end