require 'peep_service'

describe PeepService do
  let(:message) { 'This is my peep message' }
  let(:author_id) { '1' }

  describe '.post(message, author)' do
    it 'stores the given peep message and author user id' do
      PeepService.post(message, author_id)

      expect(PeepService.all[0].message).to eq message
      expect(PeepService.all[0].author_id).to eq author_id
    end

    it 'stores the post creation time' do
      PeepService.post(message, author_id)

      expect(PeepService.all[0].created_at).to be_an_instance_of(DateTime)
    end
  end
end