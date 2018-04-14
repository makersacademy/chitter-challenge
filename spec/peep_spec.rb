require 'peep'

describe Peep do

  let(:subject){ described_class.new(id: 1, username: 'user', message: 'testing', time: '22:00 08/08/18' )}

  it 'should stores the id' do
    expect(subject.id).to eq 1
  end

  it 'should stores the username' do
    expect(subject.username).to eq 'user'
  end

  it 'should stores the message' do
    expect(subject.message).to eq 'testing'
  end

  it 'should stores the time' do
    expect(subject.time).to eq '22:00 08/08/18'
  end
  
end
