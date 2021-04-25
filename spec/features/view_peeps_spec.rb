require 'pg'

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


