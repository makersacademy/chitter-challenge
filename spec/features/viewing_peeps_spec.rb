require 'pg'

feature 'Viewing peeps on the wall' do
  scenario 'A user can see their peeps in Chitter' do
    sign_up
    log_in
    add_peep

    visit('/peep')
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(peep_text: 'Every application somehow needs PosgreSQL', user_id: '45')
  end
end