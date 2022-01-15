require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')

    expect(page).to have_content "Chitter"
  end
end

feature 'Seeing peeps' do
  scenario 'a user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chitter VALUES (1, 'This is my first peep');")
    connection.exec("INSERT INTO chitter VALUES (2, 'Hello Peeps!');")
    
    visit '/peeps'

    expect(page).to have_content 'This is my first peep'
    expect(page).to have_content 'Hello Peeps!'
  end
end
    
  

  
  