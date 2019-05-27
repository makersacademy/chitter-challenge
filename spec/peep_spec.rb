require 'pg'
require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.create(content:'My first peep!' )
      Peep.create(content:'Hello, World' )
      Peep.create(content:'Let me tell you something about Chitter..' )

      peeps = Peep.all

      expect(peeps).to include("My first peep!")
      expect(peeps).to include("Hello, World")
      expect(peeps).to include("Let me tell you something about Chitter..")
    end
  end
  
   describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'I am a new peep')

      expect(Peep.all).to include 'I am a new peep'
    end
  end
end
