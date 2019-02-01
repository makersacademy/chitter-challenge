require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see previous peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('First peep');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Second peep');")

    visit('/peeps')

    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
  end
end
