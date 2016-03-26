require_relative '../app/lib/user'

describe User do

  it 'exists' do
    subject
  end

  it 'includes DataMapper' do
    expect(described_class.ancestors).to include DataMapper::Resource
  end

  it 'has an id' do
    expect(subject.send(:properties).map(&:name)).to include :id
  end

  it 'has an email' do
    expect(subject.send(:properties).map(&:name)).to include :email
  end

    it 'has an name' do
    expect(subject.send(:properties).map(&:name)).to include :name
  end

    it 'has an username' do
    expect(subject.send(:properties).map(&:name)).to include :username
  end


  let!(:user) do
    User.create(name: 'test', email: 'test@test.com', username: 'test', password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

end
