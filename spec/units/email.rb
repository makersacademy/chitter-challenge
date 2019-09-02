require 'email'

describe WelcomeEmail do
  let(:user) { double(:user, email: 'admin@chitter.com') }
  subject(:subject) { described_class.new(user) }
  it 'has an email address' do
    expect(subject.address).to eq('admin@chitter.com')
  end
  it 'has a name' do
    expect(subject.name).to eq('admin')
  end
  it 'has a subject' do
    expect(subject.subject).to eq('Welcome to Chitter!')
  end
  it 'has a body' do
    expect(subject.body).to eq('<h3>You are now signed up to Chitter, admin!</h3>')
  end

describe Tagged do
  let(:user) { double(:user, email: 'admin@chitter.com') }
  let(:peep) { double(:peep, content: 'Sample peep') }
  subject(:subject) { described_class.new(user, peep) }
  it 'has an email address' do
    expect(subject.address).to eq('admin@chitter.com')
  end
  it 'has a name' do
    expect(subject.name).to eq('admin')
  end
  it 'has a subject' do
    expect(subject.subject).to eq('Welcome to Chitter!')
  end
  it 'has a body' do
    expect(subject.body).to eq('<h3>admin, you were tagged in the following peep:</h3><p>Sample peep</p>')
  end
