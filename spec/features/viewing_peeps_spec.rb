require 'pg'

feature 'VIEWING PEEPS' do
  feature 'visiting the homepage' do
    scenario 'visiting the index page' do
      visit '/'
      expect(page).to have_content "Chitter"
    end
  end

  feature 'viewing peeps' do
    scenario 'a user can see all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (id, email, password, name, username, content) VALUES ('1', 'johndoe@gmail.com', 'password123', 'John Doe', 'johndoe', 'This the first peep');")
      connection.exec("INSERT INTO chitter (id, email, password, name, username, content) VALUES ('2', 'johndoe@gmail.com', 'password123', 'John Doe', 'johndoe', 'This the second peep');")
      connection.exec("INSERT INTO chitter (id, email, password, name, username, content) VALUES ('3', 'johndoe@gmail.com', 'password123', 'John Doe', 'johndoe', 'This the third peep');")

      visit '/peeps'
      
      expect(page).to have_content "This is the first peep"
      expect(page).to have_content "This is the second peep"
      expect(page).to have_content "This is the third peep"
    end
  end
end