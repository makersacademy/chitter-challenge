require 'user'

describe User do
  let(:name) { 'Freddie' }
  let(:user_object) { described_class.new(name) }

  describe '#instantiate' do
    it 'instantiates with a name' do
      expect { user_object }.not_to raise_error
    end
  end

  describe '#name' do
    it 'returns the name' do
      expect(user_object.name).to eq 'Freddie'
    end
  end
  
end
