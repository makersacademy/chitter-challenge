require 'time'
require_relative '../app/models/peep.rb'


describe Peep do

  describe "#ordering_reverse_chronological" do
    it "checks that all peeps are in reverse chronological order " do
      user = User.create(id: 1, email: "vale@gmail.com", name: "vale", username: "vale" )
      peep_1 = Peep.create(
        message: "Christmas is coming!!!!",
        created_at: Time.parse("2017-12-16 20:20:12"),
        user: user
      )

      peep_2 = Peep.create(
        message: "Sunny Day :)",
        created_at: Time.parse("2017-12-16 20:21:12"),
        user: user
      )

      expect(Peep.ordering_reverse_chronological.first).to eq(peep_2)
    end

  end
end
