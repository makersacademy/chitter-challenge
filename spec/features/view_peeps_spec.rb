require 'pg'

feature 'view peeps' do
  feature 'view chitter welcome page' do
    scenario 'visit chitter welcome page' do
      visit '/'

      expect(page).to have_content("Welcome to Chitter!")
    end
  end

  feature 'view peeps' do
    scenario 'user is able to view a peep' do
      connection = PG.connect(dbname: 'peeps_manager_test')

      connection.exec("INSERT INTO peeps VALUES(1, 'The sun is out! I wish this govt were too!');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Saw this pub sign... Come in our beer is as cold as Pritti Patels heart! LOL');")
      connection.exec("INSERT INTO peeps VALUES(3, 'Support Ukraine - join the anti-war March on Saturday');")
      visit('/peeps')
  
      expect(page).to have_content('The sun is out! I wish this govt were too!')
      expect(page).to have_content('Saw this pub sign... Come in our beer is as cold as Pritti Patels heart! LOL')
      expect(page).to have_content('Support Ukraine - join the anti-war March on Saturday')
    end
  end
end
