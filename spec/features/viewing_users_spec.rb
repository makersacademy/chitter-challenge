feature "Viewing users" do
  scenario "user can see list" do
    visit "/users"
    expect(page).to have_selector "ul"
  end

  scenario "user can see list of users" do
    connection = PG.connect(dbname: "chitter_test")

    # Add test data
    connection.exec("INSERT INTO users (name, email, password, username) VALUES ('Matt Tea', 'matt@makers.io', 'password1', 'matttea');")
    
    visit "/users"
    expect(page).to have_content "Matt Tea"
  end
end