describe Peeps do
  describe '.all' do
    it 'returns array of all tweets' do
      Peeps.add('Hello Chitter!')
      expect(Peeps.all).to eq(['Hello Chitter!'])
    end
  end

  describe '.add' do
    it 'adds a peep to the DB' do
      expect { Peeps.add('Hello Chitter!') }.to_not raise_error
    end
  end
end