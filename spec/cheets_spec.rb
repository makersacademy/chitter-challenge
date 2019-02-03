require 'cheet'

describe Cheet do
  describe '#all' do
    it 'returns all bookmarks' do
      cheets = Cheet.all
      expect(cheets).to include("Being methodical and sensible")
      expect(cheets).to include("I stick to the pomodoro technique")
      expect(cheets).to include("To get much done in little time")
    end
  end
end
