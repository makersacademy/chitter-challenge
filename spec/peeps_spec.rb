require 'peeps'

describe Peeps do
  let(:connection) { double :connection, exec: nil }
  let(:text) { "I am hungry" }
  let(:username) { "Yoncé" }
  let(:name) { "Beyonce Knowles" }
  let(:time)  { "12.34" }

  describe '#peep' do
    it 'return SQL message with the arguments' do
      expect(connection).to receive(:exec).with("INSERT INTO peeps(name, username, time, text) VALUES('Beyonce Knowles', 'Yoncé', '12.34', 'I am hungry')")
      Peeps.peep(name, username, time, text, connection)
    end
  end
end
