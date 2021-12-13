require 'peeps'

describe Peep do
  describe '#view all peeps' do
    it 'shows all posted peeps on feed ' do
      connection = PG.connect(dbname: 'chitter_test')

      # connection.exec("INSERT INTO peeps (message) VALUES('First peep');")
      # connection.exec("INSERT INTO peeps (message) VALUES('Second peep');")
      # connection.exec("INSERT INTO peeps (message) VALUES('Third peep');")
      peep = Peep.post(username: "ruby123", message: "First peep")
      Peep.post(username: "javascript123", message: "Second peep")
      Peep.post(username: "sql123", message: "Third peep")


      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id 
      expect(peeps.first.username).to eq "ruby123"
      expect(peeps.first.message).to eq "First peep"
    end
  end

  describe '#posts a new peep message' do
    it 'adds a new peep to the chitter feed ' do
      peep = Peep.post(username: "ruby123", message: "This is my first peep!")
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")


      # expect(peep['username']).to eq "ruby123"
      # expect(peep['message']).to eq "This is my first peep!"
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id'] 
      expect(peep.username).to eq "ruby123"
      expect(peep.message).to eq "This is my first peep!"
    end
  end


end