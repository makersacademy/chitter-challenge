require 'pg'
require_relative '../lib/peep'

describe Peep do
  describe '.create' do
    it "allows the user to post a peep" do
      Peep.create(message: 'Hello everyone on Chitter')
      expect(Peep.all).to include('Hello everyone on Chitter')
    end
  end
end
