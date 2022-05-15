require './lib/chit'

describe Chit do
  describe '.all' do
    it 'returns all chits' do
      timestamp = Time.new.strftime "%H:%M:%S %d-%m-%Y"
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO chits (handle, content, timestamp) VALUES ('Bob', 'help I''m tired yo', '#{timestamp}');")
      connection.exec("INSERT INTO chits (handle, content, timestamp) VALUES ('Alan', 'Can I just shock you? I like wine', '#{timestamp}');")
      connection.exec("INSERT INTO chits (handle, content, timestamp) VALUES ('Gayle', 'My cat was right about you', '#{timestamp}');")
      chits = Chit.all
      expect(chits[0]).to include("help I'm tired yo")
      expect(chits[0]).to include("Bob")
      expect(chits[1]).to include("Can I just shock you? I like wine")
      expect(chits[1]).to include("Alan")
      expect(chits[2]).to include("My cat was right about you")
      expect(chits[2]).to include("Gayle")
    end
  end

  describe '.post' do
    it 'adds a chit' do
      connection = PG.connect(dbname: 'chitter_test')
      Chit.post('Tina', 'Do you think horses get songs stuck in their heads?')
      chits = Chit.all
      expect(chits[3]).to include('Do you think horses get songs stuck in their heads?')
      expect(chits[3]).to include('Tina')
    end
  end

  describe '.post' do
    xit 'includes a timestamp' do
      connection = PG.connect(dbname: 'chitter_test')
      Chit.post("I respect wood", "Larry")
      chits = Chit.all
      expect(chits).to include(['I respect wood', "Larry"])#add time test
    end
  end

  describe '.sign_up' do
    xit 'takes a username, handle, email and password from a user and stores them to the database'
    xit 'does not let a user sign up with a username that has been taken'
    xit 'does not let a user sign up with a handle that has been taken'
  end
end
