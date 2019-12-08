require 'peep'
require 'database_connection'

describe Peep do

  describe ".all" do
    it "outputs a list of peeps and in reverse chronological order" do

      Peep.create(userid: 'abacon', content: "this is peep1")
      Peep.create(userid: 'abacon', content: "this is peep2")
      
      peeps = Peep.all

      expect(peeps[1]['content']).to include("this is peep1")
      expect(peeps[0]['content']).to include("this is peep2")
    end

  end

end