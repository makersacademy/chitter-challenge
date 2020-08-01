feature 'viewing peeps' do
  scenario 'user visits peeps page and sees a list of peeps' do
    visit '/peeps'
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES (1, 'Wow it was hot yesterday...');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Busy doing some coding today');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Heading to the pub later!');")

    peeps = Peeps.all
    expect(peeps).to include 'Wow it was hot yesterday...'
    expect(peeps).to include 'Busy doing some coding today'
    expect(peeps).to include 'Heading to the pub later!'
  end
end
