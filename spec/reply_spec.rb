require 'reply'
describe Reply do

  context 'I want to be able to reply to peoples messages' do

    let(:reply) { Reply.new(id: 1, message: "hello hello", create_date: "2021-07-12 20:46:56.952782", username: 'whatever', message_id: 1) }

    it 'init' do   
      expect(reply.id).to eq 1
      expect(reply.message).to eq "hello hello"
      expect(reply.create_date).to eq "2021-07-12 20:46:56.952782"
    end

  end

end