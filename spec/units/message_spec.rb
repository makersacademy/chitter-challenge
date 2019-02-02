require 'message'

RSpec.describe Message do

  describe '#all' do
    it 'returns the list of peeps' do
      peeps = Message.all
      expect(peeps).to include('Hello!')
      expect(peeps).to include('Today is Saturday')
      expect(peeps).to include('Goodbye!')

    end

  end

end
