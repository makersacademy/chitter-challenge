feature 'Home page' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
       expect(page).to have_content 'Welcome to Chitter!'
    end
  end

  feature 'viewing peeps' do
    scenario 'peeps are visible' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO chitter (peeps) VALUES ('Knock knock');")
      visit '/peeps'
      expect(page).to have_content 'Knock knock'
    end
  end
end
