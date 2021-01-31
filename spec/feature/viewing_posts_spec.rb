require "pg"

feature "Viewing posts" do
  scenario "the user can see the posts" do
    
    # Connect to the test database

    connection = PG.connect(dbname: "message_manager_test")

    # Add test message

    connection.exec("INSERT INTO messages (message) VALUES ('What''s up!');")

    # Expect message to be on the page

    visit("/")
    expect(page).to have_content("What's up!")

  end
end