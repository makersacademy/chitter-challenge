require 'peep_record'

RSpec.describe PeepRecord do
  let(:test_record) { PeepRecord.new }

  it 'stores a list of tweets from a particular user' do
    test_record.new_peep 'this is a peep'
    test_record.new_peep 'this is another peep'

    expect(test_record.all).to eq ['this is a peep', 'this is another peep']
  end
end
