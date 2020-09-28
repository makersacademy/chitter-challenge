feature 'Viewing peeps' do
    scenario 'A user can see peeps' do
      visit('/peeps')
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO my_peeps (peep) VALUES ('This is my first peep');")
      expect(page).to have_content "This is my first peep"
    
    end
  end
  