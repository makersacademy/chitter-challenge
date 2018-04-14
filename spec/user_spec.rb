require 'user'

describe User do

  let(:subject){ described_class.new(id: 1, name: 'myname', email: 'abc@gmail.com', username: 'user', password: '12345')}

  it 'should stores the id' do
    expect(subject.id).to eq 1
  end

  it 'should stores the name' do
    expect(subject.name).to eq 'myname'
  end

  it 'should stores the email' do
    expect(subject.email).to eq 'abc@gmail.com'
  end

  it 'should stores the username' do
    expect(subject.username).to eq 'user'
  end

  it 'should stores the username' do
    expect(subject.password).to eq '12345'
  end

end
