require 'pg'

feature 'viewing peeps' do
  scenario 'a user can see peeps on the homepage' do
    connection = PG.connect(dbname: 'peeps_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('This is the first peep');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('This is the second peep');")

    visit ('/')
    expect(page).to have_content "This is the first peep"
    expect(page).to have_content "This is the second peep"
  end
end
