require 'log_in'
require_relative 'database_helpers.rb'

describe LogIn do
  describe '.validate' do
    context 'account does not exist' do
     it 'returns false' do
      expect(described_class.validate("johnsmith@example.com", "password123")).to eq false
     end 
    end

    context 'account exists' do
      before do
        add_user_to_DB()
      end

      it 'returns false if one of the entered credentials is wrong' do
        expect(described_class.validate("wrongemail@invalid.com", "password123")).to eq false
        expect(described_class.validate("johnsmith@example.com", "wrongpassword")).to eq false
      end

      it 'returns true if credentials entered correctly' do
        expect(described_class.validate("johnsmith@example.com", "password123")).to eq true
      end
      
    end
  end
end