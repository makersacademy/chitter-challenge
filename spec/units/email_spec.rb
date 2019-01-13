require 'email'

describe Email do
    let(:user1){ double('user', name: 'peridot', username:'datDot', email: 'peridot@universe.world')}
    let(:user2){ double('user', name: 'lapiz', username:'lazzi', email: 'lapis@universe.world')}
    context 'want to send an email' do 

        # it 'cycle through list of reciepitents and send to each' do
        #     allow(user1).to receive(:each).and_return(self)
        #     allow(user1).to receive(:send_message).and_return(true)
        #     expect(subject.send_to(user1)).to eql(true)
        # end
    end
end