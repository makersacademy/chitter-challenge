require 'peeps'
require'pg'

describe '.feed' do 
  it 'returns a list of peeps' do 

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'WAAASSUPPPPPPPPP XDDDD', CURRENT_TIMESTAMP, 'ThatDude');")
    connection.exec("INSERT INTO peeps VALUES(2, 'I bet you $317,083,791,653 you did not read that number, Lol I got you again the last 3 is not a 3 it’s the Russian letter for Z', CURRENT_TIMESTAMP, 'ItsMeAgain');")
    connection.exec("INSERT INTO peeps VALUES(3, 'WAAASSUPPPPPPPPP ThatDude!!', CURRENT_TIMESTAMP, 'OtherDude');")

    peeps = Peeps.feed

    connection = PG.connect(dbname: 'chitter_test')

    expect(peeps).to include "WAAASSUPPPPPPPPP XDDDD"
    expect(peeps).to include "I bet you $317,083,791,653 you did not read that number, Lol I got you again the last 3 is not a 3 it’s the Russian letter for Z"
    expect(peeps).to include "WAAASSUPPPPPPPPP ThatDude!!"
  
  end
end

describe '.create' do 
  it 'creates a new peep' do

    connection = PG.connect(dbname: 'chitter_test')

    peeps = Peeps.create('Test peep 123', 'Rafa').first

    expect(peeps['peep']).to eq 'Test peep 123'
    expect(peeps['user_name']).to eq 'Rafa'
    expect(peeps['date_time']).to be_truthy
  end
end
