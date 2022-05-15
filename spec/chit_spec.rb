require './lib/chit'

describe Chit do
  describe '.all' do
    it 'returns all chits' do
      timestamp = Time.new.strftime "%H:%M %d-%m-%Y"
      connection = PG.connect(dbname: 'chitter_test')
      chit = Chit.post(handle: 'Bob', content: "help I'm tired yo")
      Chit.post(handle: 'Alan', content: 'Can I just shock you? I like wine')
      Chit.post(handle: 'Gayle', content: 'My cat was right about you')
      chits = Chit.all
      expect(chits.length).to eq 3
      expect(chits.first).to be_a Chit
      expect(chits.first.handle).to eq 'Bob'
      expect(chits.first.content).to eq "help I'm tired yo"
    end
  end

  describe '.post' do
    it 'adds a chit' do
      time_of_test = Time.new.strftime "%H:%M %d-%m-%Y"
      connection = PG.connect(dbname: 'chitter_test')
      chit = Chit.post(handle: 'Tina', content: 'Do you think horses get songs stuck in their heads?')
      expect(chit).to be_a Chit
      expect(chit.content).to include('Do you think horses get songs stuck in their heads?')
    end
  end

  describe '.post' do
    it 'includes a timestamp' do
      time_of_test = Time.new.strftime "%H:%M %d-%m-%Y"
      connection = PG.connect(dbname: 'chitter_test')
      chit = Chit.post(handle: "Larry", content: "I respect wood")
      expect(chit.timestamp).to include(time_of_test)
    end
  end

  describe '.sign_up' do
    xit 'takes a username, handle, email and password from a user and stores them to the database'
    xit 'does not let a user sign up with a username that has been taken'
    xit 'does not let a user sign up with a handle that has been taken'
  end
end
