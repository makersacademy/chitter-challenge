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

feature 'Viewing peeps in reverse order' do
    let (:order) {['I love sandwiches', 'I ate a sandwich today']}
    scenario 'User can see Peeps in reverse order, latest first' do 
    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (peep) VALUES ('I ate a sandwich today');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('I love sandwiches');")

    visit('/chitter')
    
    expect(order).to eq(['I love sandwiches', 'I ate a sandwich today'])
    end 
end 

feature 'Viewing peep dates' do 
    scenario 'user can see the dates that the peeps were added' do
        connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (peep) VALUES ('I ate a sandwich today');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('I love sandwiches');")

    visit('/chitter')

    expect(page).to have_content ("I love sandwiches")
    end 
end 
        



