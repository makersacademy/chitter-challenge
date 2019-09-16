# require_relative './lib/databaseconnection_setup.rb'

describe '#Database' do
  it 'truncs correctly' do
    trunc_test_database
    p ENV['ENVIRONMENT']
    result1 = DBcon.query('SELECT * from peep')
    result2 = DBcon.query('SELECT * from users')
    expect(result1.values).to eq([])
    expect(result2.values).to eq([])
  end
  it 'drops correctly' do
    drop_test_database
    result1 = DBcon.query('SELECT * from peep')
    result2 = DBcon.query('SELECT * from users')
    expect(result1.values).to eq([])
    expect(result2.values).to eq([])
  end
  it 'populates test DB correctly' do
    drop_test_database
    populate_test_database
    DBcon.setup('chitter_test')
    result1 = DBcon.query('SELECT * from peep')
    result2 = DBcon.query('SELECT * from users')
    expect(result1.values[0][0]).to eq('1')
    expect(result1.values[0][1]).to eq('Test1')
    expect(result1.values[0][3]).to eq('1')
    expect(result1.values[3][1]).to eq('Test4')
    expect(result2.values[0][1]).to eq('Volker')
    expect(result2.values[2][2]).to eq('volker3@volker3.com')
  end
end
