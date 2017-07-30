describe Reply do
  subject(:reply) { described_class }
  content = "message"
  let(:test_reply) { reply.create(content: content) }

  it 'should have content' do
    expect(test_reply.content).to eq content
  end

  it 'should have a time created' do
    Timecop.freeze do
      test_reply2 = reply.create(content: content, created_at: DateTime.now)
      expect(test_reply2.created_at).to eq DateTime.now
    end
  end
end
