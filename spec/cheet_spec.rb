require 'cheet'

describe Cheet do

  describe '.create' do
    it 'creates a new cheet' do
      newcheet = Cheet.create("new")
      expect(newcheet.content).to eq("new")
    end
  end

  describe '.all' do
    it 'shows a list of cheets' do
      greetcheet = Cheet.create("hello")
      Cheet.create("bellow")
      expect(Cheet.all).to include(greetcheet)
    end
  end
end
