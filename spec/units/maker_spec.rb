require 'maker'
describe Maker do
  describe '#create' do
    it 'gets created with a name, username, id and email id' do
      maker = Maker.create(name: "Joe Bloggs", user_name: "joebloggs", email: "joebloggs@gmail.com", password: "password")
      conn = PG.connect(dbname: 'chitter_test')
      result = conn.exec("SELECT * from maker where id = #{maker.id};").first
      expect(maker).to be_a Maker
      expect(result['name']).to eq "Joe Bloggs"
      expect(result['user_name']).to eq "joebloggs"
      expect(result['email']).to eq "joebloggs@gmail.com"
    end
  end

  describe '#read' do
    it 'retrieves details of a maker' do
      maker = Maker.create(name: "Joe Bloggs", user_name: "joebloggs", email: "joebloggs@gmail.com", password: "password")
      read_maker = Maker.read(id: maker.id)
      expect(read_maker.name).to eq maker.name
      expect(read_maker.user_name).to eq maker.user_name
      expect(read_maker.email).to eq maker.email
      expect(read_maker.password).to eq maker.password

    end
  end

  describe '#find' do
    it 'finds the maker with the given email and password' do
      maker = Maker.create(name: "Joe Bloggs", user_name: "joebloggs", email: "joebloggs@gmail.com", password: "password")
      read_maker = Maker.find(email: maker.email, password: maker.password)
      expect(read_maker.name).to eq maker.name
      expect(read_maker.user_name).to eq maker.user_name

    end
  end
end
