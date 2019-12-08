require "pg"

feature "news page" do

  scenario "display 'Current Events!' on the page" do
    visit("/news")
    expect(page).to have_content("Current Events!")
  end

  scenario "A user can see a status on the 'news' page" do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO statuses VALUES(1, 'I <3 makers', 'mr.maker');")
    connection.exec("INSERT INTO statuses VALUES(2, 'I am a comment', 'test123');")
    connection.exec("INSERT INTO statuses VALUES(3, 'hello world', 'higuy');")

    visit("/news")

    expect(page).to have_content("I <3 makers")
    expect(page).to have_content("I am a comment")
    expect(page).to have_content("hello world")
  end

end
