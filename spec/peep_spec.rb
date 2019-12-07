require 'peep'

describe Peep do

  provocative_opinion_1 = "I like making words with letters and stuff"
  provocative_opinion_2 = "Crisp sandwiches for breakfast, yeah?"

  describe '.post' do
    it 'posts your message to chitter' do
      peep = Peep.post(provocative_opinion_1)
      expect(peep). to eq(provocative_opinion_1)
    end
  end

#   describe '.show' do
#     it 'shows all of the posts' do
#
#     # Adding test data
#     Peep.post(provocative_opinion_2)
#     Peep.post(provocative_opinion_1)
#
#     peepfest_blackhole = Peep.show
#
#     expect(peepfest_blackhole.first). to eq provocative_opinion_2
#
#     end
#   end
#
# end
