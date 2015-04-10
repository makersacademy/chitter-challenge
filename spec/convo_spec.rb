describe Convo do

  context 'to check if i have set this up right' do
    it 'is created and destroyed' do
      expect(described_class.count).to eq 0
      described_class.create(title: 'Greeting',
                             message: 'Hello everyone')
      expect(described_class.count).to eq 1
      convo = described_class.first
      expect(convo.message). to eq 'Hello everyone'
      expect(convo.title).to eq 'Greeting'
      convo.destroy
      expect(described_class.count). to eq 0
    end
  end

end
