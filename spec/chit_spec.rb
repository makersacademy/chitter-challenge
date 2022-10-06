describe '.all' do
  it 'return a list of chits' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chit VALUES (1,'Hey my first chit');")
    connection.exec("INSERT INTO chit VALUES (2,'Look pops, I am chitting');")
    connection.exec("INSERT INTO chit VALUES (3,'Wassup!');")

    chit = Chit.all
    
    expect(chit).to include("Hey my first chit")
    expect(chit).to include("Look pops, I am chitting")
    expect(chit).to include("Wassup!")
  end
end
