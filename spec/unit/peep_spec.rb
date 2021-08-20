require 'peep'

describe Peep do

  context '.create' do

    it 'allows you to create a message' do
      expect{ Peep.create(message: 'How is everyone doing?') }.to change{ Peep.all.length }.by (1)
    end

  end

end
