require 'user'

describe User do
  let(:subject){described_class.new(id: 1, name: 'gadiza', username: 'admin', password: '9999', email: 'rara@hotmail.com')}

  it 'should store the name' do
    expect(subject.name).to eq 'gadiza'
  end

  it 'should store the email' do
    expect(subject.email).to eq 'rara@hotmail.com'
  end

  it 'should store the password' do
    expect(subject.password).to eq '9999'
  end

  it 'should store the id' do
    expect(subject.id).to eq 1
  end
end
