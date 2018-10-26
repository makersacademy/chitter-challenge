feature "Posting a message" do
  scenario "Visiting the index page" do
    visit('/')
    expect(page).to have_content "Chitter"
  end
  scenario "User posts a message and sees it added to the list" do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Hello world, I''m chittering!');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'Yes, yes you are!');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'it's great fun!');")

    visit('/')
    fill_in('message', with: "What shall we do today?")
    click_button('post')
    expect(page).to have_content("Hello world! I'm chittering!")
    expect(page).to have_content("Yes, yes you are!")
    expect(page).to have_content("it's great fun!")
    expect(page).to have_content("What shall we do today?")
  end
end
