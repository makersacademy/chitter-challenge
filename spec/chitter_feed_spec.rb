require 'spec_helper'

RSpec.configure do |config|
  config.before(:each) do
    reset_test_database
  end
end

describe ChitterFeed do

  describe '.all' do
    it 'returns a list of peeps' do
      peeps = ChitterFeed.all
      persisted_data = persisted_data(id: peeps.first.id)

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq persisted_data['id']
      expect(peeps.first.username).to eq 'danusia.x'
      expect(peeps.first.content).to eq 'Hello Chitter!'
    end
  end
end
