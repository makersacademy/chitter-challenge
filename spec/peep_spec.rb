require 'pg'
require 'spec_helper'

describe Peep do

  describe '.all' do
    it 'returns a list of the peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my second peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('This is my third peep');")
      
      peeps = Peep.all

      expect(peeps).to include("This is my third peep")
      expect(peeps).to include("This is my second peep")
      expect(peeps).to include("This is my first peep")
    end
  end
  
end