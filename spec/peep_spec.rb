require 'peep'

fdescribe Peep do
  let(:dummy_time) { Time.now }
  let(:user_id) { '1' }
  let(:peep1) { 'My first peep yoooo' }
  let(:peep2) { 'Just got this peep app! unbelievable!' }
  let(:peep3) { 'Peep is kicking off!' }
  subject { described_class.new('1', peep1, dummy_time, user_id) }
  let(:connection) { double :database_connection, exec: [
    { 'id' => '1', 'text' => peep1, 'time' => dummy_time, 'user_id' => user_id },
    { 'id' => '1', 'text' => peep2, 'time' => dummy_time, 'user_id' => user_id },
    { 'id' => '1', 'text' => peep3, 'time' => dummy_time, 'user_id' => user_id }
    ] }
  let(:peep_class) { double :peep, new: nil }

  describe '#self.all' do
    it 'creates new peep objects' do
      results = described_class.all(connection)
      expect(results[0]).to be_an_instance_of(described_class)
      expect(results[1]).to be_an_instance_of(described_class)
      expect(results[2]).to be_an_instance_of(described_class)
    end
  end

  describe '#self.create' do
    it 'calls insert command in SQL' do
      allow(Time).to receive(:now).and_return(dummy_time)
      described_class.create(peep1, user_id, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO peeps(text, time, user_id) VALUES('#{peep1}', '#{dummy_time}', '#{user_id}')")
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

  describe '#time' do
    it 'returns a time' do
      expect(subject.time).to eq dummy_time
    end
  end

  describe '#user_id' do
    it 'returns a user_id' do
      expect(subject.user_id).to eq user_id
    end
  end
end
