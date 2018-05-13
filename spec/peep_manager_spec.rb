require './app/lib/peep_manager'

describe PeepManager do
  describe '#display_posts' do
    it 'responds to #display_posts' do
      expect(described_class).to respond_to(:display_posts)
    end
  end
end