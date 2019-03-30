# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

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
end