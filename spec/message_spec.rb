require 'message'

describe Message do

  describe '.post' do
    it 'post new message' do
      message = Message.post(text: "What is the plan?")
      expect(message.text).to eq "What is the plan?"
    end

    it 'post message with timestamp' do
      message = Message.post(text: "What is the plan?")
      time = DateTime.now.strftime('%Y-%m-%d %I:%M:%S')
      expect(message.post_time).to eq time
    end

  end

  describe '.all' do
    it 'list all messages' do

      Message.post(text: "What is the plan?")
      Message.post(text: "How are you doing")
      Message.post(text: "Lets play pingpong")

      texts = Message.all.map { |message| message.text }

      expect(texts).to eq ["What is the plan?", "How are you doing",
                            "Lets play pingpong"]
    end
  end

end
