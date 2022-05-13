require 'pg'

feature 'Viewing peeps on the wall' do
  scenario 'A user can see their peeps in Chitter' do
    visit('/peep')
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(peep_text: 'Every application somehow needs PosgreSQL')
    
    visit('/peep')

    expect(page).to have_content 'Every application somehow needs PosgreSQL'
  end
end