require 'timecop'

describe Reply do
  subject(:reply)   { described_class                                       }
  let(:content)     { "message"                                             }
  let(:date_time)   { Timecop.freeze { DateTime.now }                       }
  let(:test_reply)  { reply.create(content: content)                        }
  let(:test_reply2) { reply.create(content: content, created_at: date_time) }

  it 'should have content' do
    expect(test_reply.content).to eq content
  end

  it 'should have a time created' do
      expect(test_reply2.created_at).to eq date_time
  end
end
