require 'peeps'
require 'pg'

describe '.all' do 
  it 'returns a list of peeps' do 
    conn = PG.connect(dbname: 'chitter_test')

    # Add test data
    conn.exec("INSERT INTO peeps (message) VALUES ('Test Example peep 1');")
    conn.exec("INSERT INTO peeps (message) VALUES ('Test Example peep 2');")
    conn.exec("INSERT INTO peeps (message) VALUES ('Test Example peep 3');")

    peeps = Peeps.all

    expect(peeps).to include("Test Example peep 1")
    expect(peeps).to include("Test Example peep 2")
    expect(peeps).to include("Test Example peep 3")
  end 
end 
