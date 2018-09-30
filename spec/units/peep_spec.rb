# require './lib/peep'

describe Peep do
  let(:first) { described_class.first }
  let(:user) { first.user }
  describe 'first peep' do
    it 'should have an id' do
      expect(first.id).to eq 1
    end

    it 'should have a peep' do
      expect(first.peep).to eq 'User 1 Peep 1'
    end

    it 'should have a peep_time' do
      expect(first.peep_time).to eq Time.parse('2018-09-29 12:45:08')
    end
  end
  
  describe 'first peep user' do
    it 'should have an id' do
      expect(user.id).to eq 1
    end

    it 'should have a name' do
      expect(user.name).to eq 'Test User 1'
    end
    it 'should have a username' do
      expect(user.username).to eq 'test_user_1'
    end
    it 'should have an email' do
      expect(user.email).to eq 'test@user.one'
    end
    it 'should have a password' do
      expect(user.password).to eq 'password_1'
    end
  end
end
