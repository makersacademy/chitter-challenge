require 'maker'
require 'database_helpers'

describe Maker do

  describe '.create' do
    it 'creates a new maker' do
      maker = Maker.create(name: 'Jack Stormy', email: 'jack@gmail.com' )

      persisted_data = persisted_data(table: :maker, id: maker.id)

      expect(maker).to be_a Maker
      expect(maker.id).to eq persisted_data['id']
      expect(maker.email).to eq 'jack@gmail.com'
    end
  end

  describe '.find' do
    it 'finds the user by ID' do
      maker = Maker.create(name: 'Jack Stormy', email: 'jack@gmail.com')
      result = Maker.find(id: maker)

      expect(result.id).to eq maker.id
      expect(result.name).to eq maker.email
    end

    it 'returns nil if there is no ID given' do
      expect(Maker.find(nil)).to eq nil
    end
  end

end