describe Messages do
  describe '.create' do
    it 'creates a new peep' do
      message = Messages.create(username: 'leoncross', name: 'leon', message: 'My very first peep!!!')
      expect(message).to be_a Messages
      expect(message.username).to eq 'leoncross'
      expect(message.name).to eq 'leon'
      expect(message.message).to eq 'My very first peep!!!'
    end
  end

  describe '.all' do
    it 'returns a list of messages' do
      message = Messages.create(username: 'leoncross', name: 'leon', message: 'My very first peep!!!')
      Messages.create(username: 'abarskey', name: 'andrey', message: 'a small message')
      Messages.create(username: 'sjohn', name: 'steve', message: 'another message by steve')

      messages = Messages.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Messages
      expect(messages.first.id).to eq message.id
      expect(messages.first.username).to eq 'leoncross'
      expect(messages.first.name).to eq 'leon'
    end
  end

  describe '.all_sorted' do
    it 'returns a list of messages in reverse cronological order' do
      Messages.create(username: 'leoncross', name: 'leon', message: 'My very first peep!!!')
      Messages.create(username: 'abarskey', name: 'andrey', message: 'a small message')
      Messages.create(username: 'sjohn', name: 'steve', message: 'another message by steve')

      expect(Messages.all_sorted.first.name).to eq 'sjohn'
    end
  end
end
