require 'datamapper'

describe DataMapper do
  describe '.setup' do
    it 'sets up connection to test db' do
      expect(DataMapper).to receive(:setup).with(:default, 'postgres://localhost/chitter_test')

      DataMapper.setup(:default, 'postgres://localhost/chitter_test')
    end

    it 'sets up connection to production db' do
      expect(DataMapper).to receive(:setup).with(:default, 'postgres://localhost/chitter')

      DataMapper.setup(:default, 'postgres://localhost/chitter')
    end
  end
end
