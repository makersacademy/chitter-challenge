require 'sign_up'

describe SignUp do
  describe '.username_valid?' do
    it 'should return true if username is not yet in use' do
      DatabaseConnection.query("INSERT INTO users 
        (email, username, full_name, password) VALUES
        ('johnsmith@example.com', 'Johnny S', 'John Smith', 'password123');",
        []
      )

      expect(described_class.username_valid?('Johnny S')).to eq false
      expect(described_class.username_valid?('Jdawg')).to eq true
    end

  end
end