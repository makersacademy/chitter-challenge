
RSpec.describe 'Peep' do

  describe '.create' do
    it '- should create a new peep' do
      peep = Peep.create(name: 'Jane', message: 'This is a test peep!')
      expect(peep).to be_a Peep
      expect(peep.name).to eq 'Jane'
      expect(peep.message).to eq 'This is a test peep!'
    end
  end
end
