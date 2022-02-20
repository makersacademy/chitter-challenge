require 'pg'
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps in reverse order' do

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, time) VALUES('Hello', '2022-02-18 19:43:00');")
    connection.exec("INSERT INTO peeps (message, time) VALUES('Ciao ragazzi', '2022-02-17 18:33:00');")
    connection.exec("INSERT INTO peeps (message, time) VALUES('I love coding weekends', '2022-02-17 18:32:33');")
    visit('/peeps')
    expect(page).to have_content "Hello"
    expect(page).to have_content "Ciao ragazzi"
    expect(page).to have_content "I love coding weekends"
  end

  scenario 'A user can see peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, time) VALUES('Very old peep', '2022-02-15 08:43:00');")
    connection.exec("INSERT INTO peeps (message, time) VALUES('Newest peep', '2022-02-17 18:33:00');")
    connection.exec("INSERT INTO peeps (message, time) VALUES('This peep is between old and new', '2022-02-17 18:32:33');")
    visit('/peeps')
    expect("Newest peep").to appear_before("Very old peep", only_text: true)
  end
end
