describe Messenger do

  describe '.create' do
    it '#create a new message' do
      Messenger.create(message: 'hi mate')

      expect(page).to include 'hi mate'
    end
  end
end
