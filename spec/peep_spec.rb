require 'pg'
require_relative '../lib/peep'

describe Peep do
  describe '.create' do
    it "allows the user to post a peep" do
      Peep.create(message: 'Hello everyone on Chitter')
      expect(Peep.all).to include('Hello everyone on Chitter')
    end
  end

  describe '.all' do
    it 'shows peeps in reverse chronological order' do
      Peep.create(message: 'Hello everyone on Chitter')
      Peep.create(message: 'How is everyone doing?')
      expect(Peep.all).to include('Hello everyone on Chitter')
      expect(Peep.all.first).to include('How is everyone doing?')
    end
  end
end
