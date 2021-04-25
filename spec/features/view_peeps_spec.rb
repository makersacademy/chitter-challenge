require 'pg'
require 'orderly'

feature 'Visit the homepage' do
  scenario ' the page title is visible' do
    visit'/'
    expect(page).to have_content 'Chitter'
  end
end

feature 'Viewing peeps' do
  scenario 'a user can see peeps' do

    con = PG.connect(dbname: 'chitter_test')

    con.exec("INSERT INTO peeps VALUES(1, 'Peep');")
    con.exec("INSERT INTO peeps VALUES(2, 'You');")
    con.exec("INSERT INTO peeps VALUES(3, 'Hello');")
    
    visit('/peeps')
    
    expect(page).to have_content "Peep"
    expect(page).to have_content "Hello"
    expect(page).to have_content "You"
  end
end

feature 'view in reverse' do 
  scenario ' user see most recent peeps first' do
    con = PG.connect(dbname: 'chitter_test')

    con.exec("INSERT INTO peeps VALUES(1, 'Peep');")
    con.exec("INSERT INTO peeps VALUES(2, 'You');")
    con.exec("INSERT INTO peeps VALUES(3, 'Hello');")

    visit('/peeps')
    expect('Hello').to appear_before('Peep')
  end
end

feature 'view time' do
  scenario 'the post contaisn the time' do
    con = PG.connect(dbname: 'chitter_test')

    con.exec("INSERT INTO peeps VALUES(1, 'Peep');")
    con.exec("INSERT INTO peeps VALUES(2, 'You');")
    con.exec("INSERT INTO peeps VALUES(3, 'Hello');")

    visit('/peeps')

    expect(page).to have_content "#{Time.now.strftime("at: %I:%M %p")}"
  end
end

