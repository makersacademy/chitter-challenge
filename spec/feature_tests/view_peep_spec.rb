require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # connection.exec("INSERT INTO peepers VALUES(1, 'finn_the_human', 'Finn', 'Mathematical!');")
    Peep.create(peep: 'Is this thing on?')

    visit '/peeps'

    expect(page).to have_content 'Is this thing on?'
  end
end
