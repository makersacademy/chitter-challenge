require 'chitter'
require 'rspec'

describe 'it returns all chitters' do
   it 'should return all the chitter peeps' do
    connection = PG.connect(dbname: 'chitter_challenge_test')

    connection.exec("INSERT INTO chitters (peep) VALUES ('Test Chitter Message');")
    connection.exec("INSERT INTO chitters (peep) VALUES('Another test chitter');")
    connection.exec("INSERT INTO chitters (peep) VALUES('yet another test chitter');")


    chitters = Chitter.all
    expect(chitters.length).to eq 3
    expect(chitters.first).to be_a Chitter
    expect(chitters.first.peep).to eq "yet another test chitter"
  end
end

describe 'it lets you add a peep to chitter' do
  it 'should let you add a peep and add it to the database' do
    connection = PG.connect(dbname: 'chitter_challenge_test')

connection.exec("INSERT INTO chitters (peep) VALUES ('This is a new peep')")

chitters = Chitter.all
expect(chitters.first.peep).to eq "This is a new peep"
  end
end

describe 'it should return tweets in reverse order' do
  it 'should have an array of tweets in reverse order' do
    Chitter.create(peep: "First peep")
    Chitter.create(peep: "Second peep")
    chitters = Chitter.all
    expect(chitters[0].peep).to eq "Second peep"
  end
end
