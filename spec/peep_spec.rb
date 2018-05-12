require 'peep'

fdescribe Peep do
  let(:peep1) { 'My first peep yoooo' }
  let(:peep2) { 'Just got this peep app! unbelievable!' }
  let(:peep3) { 'Peep is kicking off!' }
  subject { described_class.new('1', peep1) }
  let(:connection) { double :database_connection, exec: [
    { 'id' => '1', 'text' => peep1 },
    { 'id' => '1', 'text' => peep2 },
    { 'id' => '1', 'text' => peep3 }
    ] }
  let(:peep_class) { double :peep, new: nil }

  describe '#self.all' do
    it 'creates new peep objects' do
      described_class.all(peep_class, connection)
      expect(peep_class).to have_received(:new).exactly(3).times
    end
  end

  describe '#self.create' do
    it 'calls insert command in SQL' do
      described_class.create(peep1, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO peeps(text) VALUES('#{peep1}')")
    end
  end

  describe '#id' do
    it 'returns id' do
      expect(subject.id).to eq '1'
    end
  end

  describe '#text' do
    it 'returns text' do
      expect(subject.text).to eq peep1
    end
  end
end
