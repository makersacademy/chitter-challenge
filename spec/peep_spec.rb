require 'peep'

RSpec.describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_chatter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")
  
      peeps = Peep.all

      expect(peeps.to_s).to include("This is my first peep")
      
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'This is a test')
      peeps = Peep.all
      expect(peeps.to_s).to include 'This is a test'
    end
  end

end


