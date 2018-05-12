require 'model_router'

describe Peep do
  context '#all' do
    it 'Stores peeps' do
      add_test_peeps
      expect(Peep.all.count).to eq 3
    end
  end

  context '#create' do
    it 'Can add peeps' do
      add_test_peeps
      expect(Peep.all).to eq @test_peeps
    end
  end
end
