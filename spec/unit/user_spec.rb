require 'user'

describe User do
  let(:user) { User.new('EllieM', 'makers@gmail.com', 'PASSWORD123') }
  describe '#username' do
    it 'fills in username' do
      expect(subject.username).to eq 'EllieM'
    end
  end
end
