require 'peep'

describe Peep do

  it 'creates a peep' do
    peep = Peep.new('some message')

    expect(peep.message).to eq 'some message'
  end

  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create('some message')

      expect(peep.message).to eq 'some message'
    end
  end

  describe '.all' do
    it 'has two peeps' do
      Peep.class_variable_set(:@@messages, [])
      peep = Peep.create('some message')
      Peep.create('Another message')

      expect(Peep.all.length).to eq 2
    end
  end
end