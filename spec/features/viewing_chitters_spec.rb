require 'pg'

feature 'Viewing homepage' do 
    scenario 'visiting page shows Chitter' do
    visit('/')
    expect(page).to have_content "Chitter"
    end 
end  

feature 'Viewing peeps' do
    scenario 'User can see Peeps' do 
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('I ate a sandwich today');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('I love sandwiches');")

    visit('/chitter')

    expect(page).to have_content "I ate a sandwich today"
    expect(page).to have_content "I love sandwiches"

    end 
end 
