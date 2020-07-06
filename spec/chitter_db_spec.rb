require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(body: 'My first peep!', user: '@indisaurusrex')

      peeps = Peep.all
      expect(peeps).to have_content('My first peep!', '@indisaurusrex')
    end
  end
end