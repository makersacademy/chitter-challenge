require 'pg'

feature 'list of peeps on homepage' do
  scenario 'user can see a list of peeps on the homepage' do
    connection = PG.connect(dbname: 'chitter_database_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('Is this working?');")
    connection.exec("INSERT INTO peeps (content) VALUES ('I overshare on social media!');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Does this have a different timestamp.');")

    visit('/')

    expect(page).to have_content "Is this working?"
    expect(page).to have_content "I overshare on social media!"
    expect(page).to have_content "Does this have a different timestamp."
  end
end
