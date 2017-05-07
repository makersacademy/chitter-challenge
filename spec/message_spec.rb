describe Message do
  let!(:message) do
    Message.new(content: "Hello, world!",
                user_id: 5,
                timestamp: DateTime.new(2001, 2, 3, 4, 5, 6))
  end

  describe '#formatted_time' do
    it "formats message's DateTime for increased readability" do
      expect(message.formatted_time).to eq "02/03/2001 04:05"
    end
  end

end
