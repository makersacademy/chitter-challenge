require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peeps = Peep.all
      messages = peeps.map(&:message)
      expect(messages).to include("My 1st peep")
      expect(messages).to include("My 2nd peep")
      expect(messages).to include("My 3rd peep")
    end
  end
  it 'shows all the times of peeps' do
     peeps = Peep.all
     times = peeps.map(&:time)
     expect(times).to include("2018-03-18 10:05:20")
     expect(times).to include("2018-03-17 20:24:00")
     expect(times).to include("2018-03-17 12:19:05")
   end

 # describe '.create' do
 #   it "creates a new peep" do
 #     Peep.create("Hello", "2018-03-18 12:15:10")
 #
 #     peeps = Peep.all
 #     messages = peeps.map(&:message)
 #     times = peeps.map(&:time)
 #     expect(messages).to include("Hello")
 #     expect(times).to include("2018-03-18 12:15:10")
 #   end
 #
 # end

end
