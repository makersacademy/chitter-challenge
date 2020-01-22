require 'pg'

feature 'view peeps' do
  scenario 'A maker can see peeps' do
    connection = PG.connect(dbname: 'chitterbase_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('I love Makers');")

    visit('/chitter')

    expect(page).to have_content "I love Makers"

  end
end
