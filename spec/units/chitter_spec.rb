describe Chitter do
  it 'can retrieve itmes from the database' do
    #call database and retrieve latest entry in database
    chitter = Chitter.all.first
    #checking info is correct
    expect(chitter.peep).to eq('test post')
  end
end
