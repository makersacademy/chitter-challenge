require 'sign_up'
require_relative 'database_helpers.rb'

describe SignUp do

  describe '.validate' do
    it 'returns false if username OR email is an empty string' do
      expect(described_class.validate("", "")).to eq false
      expect(described_class.validate("Johnny S", "")).to eq false
      expect(described_class.validate("", "johnsmith@example.com")).to eq false
    end
    
  end


  describe '.username_valid?' do
    it 'returns true if username is not yet in use' do
      add_user_to_DB()
      
      expect(described_class.username_valid?('Johnny S')).to eq false
      expect(described_class.username_valid?('Jdawg')).to eq true
    end

  describe '.email_valid?' do
    it 'returns true if the email is not yet in use' do
      add_user_to_DB()
      
      expect(described_class.email_valid?('johnsmith@example.com')).to eq false
      expect(described_class.email_valid?('anewemail@example.com')).to eq true
    end
    
  end

  end
end