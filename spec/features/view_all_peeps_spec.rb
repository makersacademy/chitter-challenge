feature 'To view all peeps' do
    scenario 'We can view peeps' do
        Chitters.addpeep("test peep number 2")
        # connection = PG.connect(dbname: 'test_chitter')
        # connection.exec("INSERT INTO chitter (peep) VALUES ('test peep number 2');")
        visit('/peeps')
        expect(page).to have_content('test peep number 2')
    end
end