require 'message'

describe Message do
  before(:each) { empty_test_db }
  describe '.post' do
    it 'can post a message' do
      Message.post(body: 'testbody', name: 'testname', username: 'testusername')
      message = Message.post(body: 'testbody2', name: 'testname2', username: 'testusername2')
      messages = Message.all
      p messages
      expect(messages.length).to eq 2
      expect(messages.first).to be_instance_of(Message).and have_attributes(:body => 'testbody2', :name => 'testname2', :username => 'testusername2')
    end
  end

  describe '.all' do
    before(:example) {
      Message.post(body: 'testbody', name: 'testname', username:'testusername')
      Message.post(body: 'testbody2', name: 'testname2', username: 'testusername2')
    }
    messages = Message.all
    p messages
    it 'can view the messages' do
      expect(messages[1]).to be_instance_of(Message).and have_attributes(:body => 'testbody', :name => 'testname', :username => 'testusername')
      expect(messages[0]).to be_instance_of(Message).and have_attributes(:body => 'testbody2', :name => 'testname2', :username => 'testusername2')
    end
  end
end