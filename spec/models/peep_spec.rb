describe Peep do
  subject(:peep)      { described_class                         }
  let(:content)       { "hi"                                    }
  let(:test_peep)     { peep.create(content: content)           }
  let(:test_peep2)    { peep.create(content: content,
                                    created_at: expected_date)  }
  let(:expected_date) { DateTime.now                            }

  before  { Timecop.freeze }
  after   { Timecop.return }

  it 'should contain content' do
    expect(test_peep.content).to eq content
  end

  it 'should have a time it was created' do
    expect(test_peep2.created_at).to eq expected_date
  end
end
