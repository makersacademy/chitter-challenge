require 'users'

describe Users do

  describe '.create' do
    it 'creates a user' do
      expect(Users).to respond_to(:create).with(4).arguments
    end
  end
end
