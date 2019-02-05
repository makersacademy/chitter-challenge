# frozen_string_literal: true

describe Peep do
  describe '.all' do
    it 'should return an array of Peep objects' do
      do_some_peeps
      expect(Peep.all.length).to eq(2)
    end
  end

  describe '.post_peep' do
    it 'should post a peep' do
      make_a_user
      Peep.post_peep(1, '@a', 'A!')

      connection = PG.connect(dbname: 'chitter_test')
      peep = connection.exec('SELECT * FROM peeps;')

      expect(peep[0]['content']).to eq('A!')
    end
  end

  describe '#since' do
    it 'should return a string showing amount of time passed' do
      make_a_user
      some_time_ago = Time.now - (2 * 7 * 24 * 60 * 60)
      one_peep = Peep.new('@a', 'B', 'C!', some_time_ago.to_s)
      expect(one_peep.since).to eq('14 days ago')
    end
  end
end
