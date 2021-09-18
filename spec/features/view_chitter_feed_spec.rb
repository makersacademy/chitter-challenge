require 'pg'

feature 'Viewing feed' do 
  scenario 'A user can see all previous posts' do 
    
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO chitter (name,message) VALUES('unknown', 'Hello World');")
    connection.exec("INSERT INTO chitter (name,message) VALUES('unknown', 'Hello Chitter');")
    
    visit('/feed')
    expect(page).to have_content("Hello World")
    expect(page).to have_content("Hello Chitter")
  end
end
