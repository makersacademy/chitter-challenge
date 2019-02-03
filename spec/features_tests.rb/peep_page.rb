require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/app.rb'


feature 'Viewing peep page' do
  feature 'viewing peep page' do
    scenario 'should have id number' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep VALUES(1, 'testing')")
      visit ('/peeps')
      expect(page).to have_content '1'
    end
  end
end

feature 'Viewing peep page' do
  feature 'viewing peep page' do
    scenario 'should have peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep VALUES(1, 'testing')")
      visit ('/peeps')
      expect(page).to have_content 'testing'
    end
  end
end
