require_relative '../lib/user'

describe User do

  subject(:user) { described_class.new('Jack123') }
  describe 'on #initialize' do
    it 'knows the user-name' do
      expect(subject.name).to eq 'Jack123'
    end
  end
end