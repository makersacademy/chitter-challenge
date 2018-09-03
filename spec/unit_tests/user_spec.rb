require 'user'
require 'bcrypt'

describe User do
  let(:dc) { described_class }
  let(:user) { described_class.create('dave', 'Dave Williams', 'testemail@gmail.com', 'pwd12') }

  it 'has all the details' do
    expect(user.username).to eq 'dave'
    expect(user.name).to eq 'Dave Williams'
    expect(user.email).to eq 'testemail@gmail.com'
  end

  describe '.login' do
    it 'changes the active user if details correct' do
      user = dc.log_in('andrew', 'pwd12')
      expect(user.name).to eq 'Andrew Wood'
      expect(dc.active).to eq user
    end
    it 'it won\'t change the active user if details incorrect' do
      dc.log_out if dc.active != nil
      user = dc.log_in('andrew', 'pwd123')
      expect(dc.active).to eq nil
    end
  end
  describe '.create' do
    it 'hashes the password using bcrypt' do
      user = User.create('jim', 'Jim Jimson', 'test@example.com', 'pwd12')
      expect(BCrypt::Password.new(user.password)).to eq 'pwd12'
    end
  end

end
