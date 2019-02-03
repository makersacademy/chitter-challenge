require 'cheet'

describe Cheet do
  describe '#all' do
    it 'returns all cheets' do
      cheets = Cheet.all
      expect(cheets).to include("Being methodical and sensible")
      expect(cheets).to include("I stick to the pomodoro technique")
      expect(cheets).to include("To get much done in little time")
    end

    it 'gets the cheets from a database' do
      expect(Cheet.all).to include("Being methodical and sensible")
    end
  end
end
