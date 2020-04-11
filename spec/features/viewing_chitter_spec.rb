require 'pg'

feature 'Viewing peeps' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('900 People die from Coronavirus');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Lockdown is lifted');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Coronavirus is over!');")

    visit('/peeps')

    expect(page).to have_content("900 People die from Coronavirus")
    expect(page).to have_content("Lockdown is lifted")
    expect(page).to have_content("Coronavirus is over!")
  end
end
