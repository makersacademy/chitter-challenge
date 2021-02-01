require 'encryptor'

describe String do

  describe '#encrypt' do

    it 'encrypts a string' do
      password = 'password123'
      expect(password.encrypt).not_to eq password
    end

    it 'returns the same result for each string' do
      password = 'password123'
      result_1 = password.encrypt
      expect(password.encrypt).to eq result_1
    end

  end

end
