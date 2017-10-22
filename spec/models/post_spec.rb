describe Post do

  let(:time) { DateTime.now }
  let(:post) { described_class.create(tip: "This is a tip!", created_at: time) }

  describe '#time_to_string' do
    it 'Returns a readable time format for posts display' do
      expect(post.time_to_string).to eq "Created at #{time.strftime("%R")} on #{time.strftime("%d/%-m/%-y")}"
    end
  end
end
