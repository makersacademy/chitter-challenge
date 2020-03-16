require 'pg'
feature 'posted peeps' do
  scenario 'I want to see my peeps in chronological order' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (body) VALUES ('First peep');")

    visit '/peeps'
    expect(page).to have_content('First peep')
  end
end
