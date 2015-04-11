describe User do

  let(:user) { described_class.first }

  it 'database is empty' do
    described_class.each(&:destroy)
    expect(described_class.count).to eq 0
  end

  before(:each) do
    described_class.create email: 'sanjsanj@hotmail.com',
                           user_name: 'Sanjay Purswani',
                           user_handle: 'sanjsanj',
                           password_digest: 'sometext123'
  end

  after(:each) do
    described_class.each(&:destroy)
  end

  it 'can be created in the database' do
    expect(described_class.count).to eq 1
  end

  it 'can be retrieved from the database' do
    expect(user.email).to eq 'sanjsanj@hotmail.com'
    expect(user.user_name).to eq 'Sanjay Purswani'
    expect(user.user_handle).to eq 'sanjsanj'
    expect(user.password_digest).to eq 'sometext123'
  end

  it 'can be deleted from the database' do
    user.destroy
    expect(described_class.count).to eq 0
  end

end
