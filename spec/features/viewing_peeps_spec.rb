feature 'displays peeps' do
  scenario 'user can view peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(peep: 'Test peep from database', time: Time.new(2000))
    Peep.create(peep: 'Second test peep from database', time: Time.new(2003))
    # connection.exec("INSERT INTO peeps1 VALUES(1, 'Test peep from database');")
    # connection.exec("INSERT INTO peeps1 VALUES(2, 'Second test peep from database');")

    visit('/peeps')

    expect(page).to have_content "Test peep from database"
    expect(page).to have_content "Second test peep from database"
  end
end
