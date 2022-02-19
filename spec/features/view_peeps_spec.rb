require 'pg'
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps in reverse order' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, time) VALUES ('Hello', '2022-02-18 19:43:00');")
    connection.exec("INSERT INTO peeps (message, time) VALUES('Ciao ragazzi', '2022-02-17 18:33:00');")
    connection.exec("INSERT INTO peeps (message, time) VALUES ('I love coding weekends', '2022-02-17 18:32:33');")
    visit('/peeps')
    expect(page).to have_content "Hello"
    expect(page).to have_content "Ciao ragazzi"
    expect(page).to have_content "I love coding weekends"
  end
end
