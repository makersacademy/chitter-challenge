# require 'pg'
require 'web_helpers'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    make_fake_peeps 
    visit('/peeps')
    expect(page).to have_content 'Mathematical!'
    expect(page).to have_content 'Makin\' bacon pancakes'
    expect(page).to have_content 'Yay!'
  end
    # connection = PG.connect(dbname: 'chitter_test')

    # connection.exec("INSERT INTO peepers VALUES(1, 'finn_the_human', 'Finn', 'Mathematical!');")
    # Peep.create(peep: 'Is this thing on?')

    # visit '/peeps'

    # expect(page).to have_content 'Is this thing on?'
end
