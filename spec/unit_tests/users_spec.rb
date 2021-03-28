require 'users'

describe Users do
  before do
    Users.setup
    Users.signup('Han Solo', 'Solo', 'han@mfalcon.com', 'C4rb0n1te')
  end

  describe '.signup' do
    it 'adds a user to the database' do
      expect(Users.signup('Obi Wan Kenobi', 'OB1', 'kenobi@jedi.com', 'L1gh7S4b3r')).to eq 'OB1 registered'
    end
  end

  describe '.duplicate_email?' do
    it 'sends back true if there is a duplicate email' do
      expect(Users.duplicate_email?('han@mfalcon.com')).to be true
      expect(Users.duplicate_email?('chewie@mfalcon.com')).to be false
    end
  end

  describe '.duplicate_username?' do
    it 'sends back true if there is a duplicate username' do
      expect(Users.duplicate_username?('Solo')).to be true
      expect(Users.duplicate_username?('chewie')).to be false
    end
  end

  describe '.get_username' do
    it 'provides the username based on user_id' do
      expect(Users.get_username('1')).to eq 'Solo'
    end
  end
end
