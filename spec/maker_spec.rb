require 'maker'

describe Maker do
  describe '.add' do
    it 'adds a new Maker to the database' do
      Maker.add('Joanne Bloggs', 'jb', 'joanne@jb.com', 'joannepwd')
      sql = "SELECT * from makers where username = 'jb';"
      results = DatabaseConnection.query(sql)
      expect(results.first['name']).to eq("Joanne Bloggs")
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('joannepwd2')
      Maker.add('Joanne Bloggs2', 'jb2', 'joanne2@jb.com', 'joannepwd2')
    end
  end 
  # it 'sets a new user to the current user' do
  #
  # end
  # describe '.get' do
  # it 'gets the maker with the specified id from the databse' do
  #
  # end
end
