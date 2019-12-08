require 'peep'
require 'pg'

describe Peep do

  provocative_opinion_1 = "I like making words with letters cos its good."
  provocative_opinion_2 = "Crisp sandwiches for breakfast, yeah?"

  describe '.post' do
    it 'posts your message to chitter' do
      peep = Peep.post(message: provocative_opinion_1, handle: '@meagain', time: Time.now)

      expect(peep).to be_a Peep
      expect(peep.message).to eq(provocative_opinion_1)
    end
  end

  describe '.all' do
    it 'shows all of the posts' do
      connection = PG.connect(dbname: 'chitter_test')

    # Adding test data
    peep_first = Peep.post(message: provocative_opinion_1, handle: '@meagain', time: Time.now)
    Peep.post(message: provocative_opinion_2, handle: '@youagain', time: Time.now)

    peepfest_blackhole = Peep.all

    expect(peepfest_blackhole.length). to eq 2
    expect(peepfest_blackhole.first). to be_a Peep
    expect(peepfest_blackhole.first.message). to eq(provocative_opinion_1)

    end
  end

end
