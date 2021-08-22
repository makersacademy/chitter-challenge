require 'peep'

describe Peep do

  describe '.create' do

    it 'allows you to create a message' do
      expect{ Peep.create(message: 'How is everyone doing?', posted: DateTime.now.strftime('%d/%m/%_Y %_H:%_M')) }.to change{ Peep.all.length }.by (1)
    end

  end

  describe '.all' do

    it 'returns an array of hashes each consisting of an id and message key' do
      Peep.create(message: 'How is everyone doing?', posted: DateTime.now.strftime('%d-%m-%_Y %_H:%_M%_S'))
      expect(Peep.all.first).to include(:id => Numeric, :message => 'How is everyone doing?')
    end

    it 'contains a timestamp of when it was posted' do
      Peep.create(message: 'How is everyone doing?', posted: DateTime.now.strftime('%d-%m-%_Y %_H:%_M%'))
      expect(Peep.all.first[:posted]).to start_with(DateTime.now.strftime('%d-%m-%_Y %_H:%_M'))
    end

  end

end
