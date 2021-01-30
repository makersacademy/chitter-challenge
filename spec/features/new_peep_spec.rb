require 'pg'
feature 'Post a new peep' do
    scenario 'enter peep and click post' do
       
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO peeps (message) VALUES ('1 peep');")
        connection.exec("INSERT INTO peeps (message) VALUES('2 peep');")
        connection.exec("INSERT INTO peeps (message) VALUES('3 peep');")
        
        visit '/peeps/new'
        
        # expect(page).to have_content '1 peep'
        # expect(page).to have_content '2 peep'
        # expect(page).to have_content '3 peep'
    end
end 

#fill_in('peeps', with: 'My first peep')
        # click_button 'Go'
