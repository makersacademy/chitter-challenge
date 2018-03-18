require 'instance'

describe Instance do
  subject(:chitter) { described_class.new }

  describe '#login' do
    it 'logs in a user' do
      Instance.login("tom@hotmail.com", "tom")
      expect(Instance.current_users.find {|user| user.email == "tom@hotmail.com"}).to_not be_nil
    end
  end
end

