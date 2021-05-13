require 'chitter'

describe Chitter do

  let(:subject) { Chitter }

  context 'add method' do
    it 'should add a message to all' do
      subject.add(text: 'This is a test message', id:0)
      expect(subject.all.last.user_id).to eq 0
      expect(subject.all.last.text).to eq 'This is a test message'
    end
  end

end
