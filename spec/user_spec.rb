require 'pg'
require 'user'

describe User do
    context 'Does this connect to the db?' do

    conn = PG.connect(dbname: 'chitter_test')
    conn.exec("INSERT INTO users (username) VALUES('panyd');")

    it 'tells me that it\'s connect to the db' do
        expect(subject).to include("panyd")

    end 
    end

end