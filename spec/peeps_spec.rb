require 'database_helpers'

describe Peeps do
  describe '#create' do
    it 'can add data to the peeps table' do
      peep = Peeps.create("Test message", "Ajay1234")
      persisted_data = persisted_peeps_data(peep.message_id)

      expect(peep.message).to eq "Test message"
      expect(peep.message_id).to eq persisted_data['id']
      expect(peep.message_created).to eq persisted_data['created']
    end

  end

  describe '#read' do
    it 'can read data from the peeps table' do
      Peeps.create("Test message", "Ajay1234")
      Peeps.create("Wasssuuuppp", "Ajay1234")
      Peeps.create("Hi everybody", "Ajay1234")
      messages = Peeps.read

      expect(messages.length).to eq 3
      expect(messages.first.message).to eq "Test message"
      expect(messages.first.username).to eq "Ajay1234"
    end

    it 'has a record that contains a timestamp' do
      Peeps.create("Test message", "Ajay1234")
      time = Time.now.strftime("%Y-%m-%d %H:%M")
      messages = Peeps.read

      expect(messages.first.message_created).to include time
    end
  end

  describe '#sort' do
    it 'can return records in descending order' do
      Peeps.create("Tester message", "Ajay1234")
      sleep 1
      Peeps.create("Wasssuuuppp", "Ajay1234")
      sleep 1
      Peeps.create("Hi everybody", "Ajay1234")
      messages = Peeps.read("descending")

      expect(messages.first.message).to eq "Hi everybody"
      expect(messages.last.message).to eq "Tester message"
    end
  end
end
