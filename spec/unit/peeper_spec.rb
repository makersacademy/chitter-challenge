require 'peeper'

describe Peeper do

  describe "#all" do

    it "returns all the previous peeps" do

      prime_database
      p my_timeline = Peeper.all
      expect(my_timeline.first.text).to include("Holy moly, what is this site meant to be??")

    end

  end

end
