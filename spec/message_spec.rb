require 'Date'


describe Message do
  describe 'Display all message posts' do
    it 'returns all Peeps' do
      connection = PG.connect(dbname: 'chitter_db_test')
      connection.exec("INSERT INTO messages (peep, tag) VALUES ('It was a great week at Makers!', '@Br0ckers');")
      connection.exec("INSERT INTO messages (peep, tag) VALUES ('We learned about databases!', '@Br0ckers');")
      connection.exec("INSERT INTO messages (peep, tag) VALUES ('databases suck!', '@Br0ckers');")
      # @message = Message.new
      # expect(@message.date).to be_an_instance_of(Date)
       messages = Message.all
      expect(messages).to include({peep: 'It was a great week at Makers!', date: (/2018-10/), tag: '@Br0ckers' })
      expect(messages).to include({peep: 'We learned about databases!', date: (/2018-10/), tag: '@Br0ckers' })
      expect(messages).to include({peep: 'databases suck!', date: (/2018-10/), tag: '@Br0ckers' })

    end
  end

  describe 'Displays add messgae via post method' do
    it 'returns added Peep' do
      connection = PG.connect(dbname: 'chitter_db_test')
      Message.add('Test Post', '@Br0ckers')
      messages = Message.all
      expect(messages).to include({peep: 'Test Post', date: (/2018-10/), tag: '@Br0ckers' })
    end
  end
end
