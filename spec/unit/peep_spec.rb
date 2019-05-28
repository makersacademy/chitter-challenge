describe Peep do

  it 'can connect to a test or development database' do
    database = Peep.database
    expect(database).not_to eq(nil)
  end

  it 'database is reset every test' do
    database = Peep.database
    result = database.exec("SELECT * FROM peep;")
    expect(result.first).to eq(nil)
  end

  it 'can add record to database' do
    database = Peep.database
    database.exec("INSERT INTO peep (message) VALUES('Iya luv');")
    result = database.exec("SELECT * FROM peep;")
    expect(result.first['message']).to include('Iya luv')
  end

  it 'add method adds to database' do
    Account.add('me')
    Peep.add('Iya luuv', Account.by_handle('me').id)
    database = Peep.database
    result = database.exec("SELECT * FROM peep;")
    expect(result.first['message']).to include('Iya luuv')
  end

  it 'cannot add message over 140 chars' do
    long_message = 'lalalalala' * 100
    expect{Peep.add(long_message)}.to raise_error
  end

  it 'cannot add empty message' do
    empty_message = ''
    expect{Peep.add(empty_message)}.to raise_error
  end

  it 'all method reads all records from database' do
    Account.add('me')
    Peep.add('Yes mate', Account.by_handle('me').id)
    Peep.add('No mate', Account.by_handle('me').id)
    expect(Peep.all.first.message).to eq('Yes mate')
    expect(Peep.all.last.message).to eq('No mate')
  end

  it 'records have timestamps' do
    Account.add('me')
    Peep.add('Hello dear rabbit', Account.by_handle('me').id)
    expect(Peep.all.first.time_sent).not_to eq(nil)
  end


end
