require 'peep'

describe Peep do
  let(:peep1) { 'My first peep yoooo' }
  let(:peep2) { 'Just got this peep app! unbelievable!' }
  let(:peep3) { 'Peep is kicking off!' }
  let(:connection) { double :database_connection, exec: [
    { 'id' => '1', 'text' => peep1 },
    { 'id' => '1', 'text' => peep2 },
    { 'id' => '1', 'text' => peep3 }
    ] }

  describe '#self.all' do
    it 'returns an array of peeps' do
      expect(described_class.all(connection)).to eq [peep1, peep2, peep3]
    end
  end

  describe '#self.create' do
    it 'calls insert command in SQL' do
      described_class.create(peep1, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO peeps(text) VALUES('#{peep1}')")
    end
  end
end
