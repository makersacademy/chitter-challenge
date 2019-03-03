require 'maker'

describe Maker do
  it 'adds a new Maker to the database' do
    Maker.add('Joanne Bloggs', 'jb', 'joanne@jb.com', 'joannepwd')
    sql = "SELECT * from makers where username = 'jb';"
    results = DatabaseConnection.query(sql)
    expect(results.first['name']).to eq("Joanne Bloggs")
  end
  # it 'sets a new user to the current user' do
  #
  # end
  # describe '.get' do
  # it 'gets the maker with the specified id from the databse' do
  #
  # end
end
