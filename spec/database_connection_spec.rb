require './lib/datamapper'

describe DataMapper do
  describe '.setup' do
    it 'sets up a connection to production database' do
      expect(DataMapper).to receive(:setup).with(:default, 'postgres://localhost/chitter')
      DataMapper.setup(:default, 'postgres://localhost/chitter')
    end

    it 'sets up a connection to the test database' do
      expect(DataMapper).to receive(:setup).with(:default, 'postgres://localhost/chitter_test')
      DataMapper.setup(:default, 'postgres://localhost/chitter_test')
    end
  end
end
