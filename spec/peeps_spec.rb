require 'peeps'
require 'database_helpers'

describe Peeps do
  describe '.post' do
    it 'posts a new peep message' do
      new_peep = Peeps.post('Hello World')
      p new_peep
      persisted_data = persisted_data(new_peep.id)
      
      expect(new_peep).to be_a Peeps
      expect(new_peep.message).to eq 'Hello World'
      expect(new_peep.id).to eq persisted_data['id']
    end
  end
end