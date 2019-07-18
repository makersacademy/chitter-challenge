require 'chitter'

  describe Chitter do
    describe '.post' do
      it 'posts a messsage to the Chitter database' do
        Chitter.post(message: 'Hello, world')

        expect(Chitter.all).to include 'Hello, world'
      end
    end

    describe '.all' do
      it 'Shows all the messages added to the database' do
        Chitter.post(message: 'Hello, world')
        Chitter.post(message: 'What a goal!')
        Chitter.post(message: 'Come on you reds')

        peeps = Chitter.all

        expect(peeps).to include('Hello, world')
        expect(peeps).to include('What a goal!')
        expect(peeps).to include('Come on you reds')
      end
    end
  end
