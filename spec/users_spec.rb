describe Users do

subject(:user) {described_class.new(
  id: 1,
  username: 'username',
  password: 'password',
  age: 100,
  gender: 'm',
  picture: 'picture'
  )}

  let(:connection) {double :connection, query: results}
  let(:results) {double :result}
  let(:connect_database_class) {double :connect_database_class, start: connection}


  it "knows its id" do
    expect(user.id).to eq 1
  end

  it "knows its username" do
    expect(user.username).to eq 'username'
  end

  it "knows its password" do
    expect(user.password).to eq 'password'
  end

  it "knows its age" do
    expect(user.age).to eq 100
  end

  it "knows its gender" do
    expect(user.gender).to eq 'm'
  end

  it "knows its picture" do
    expect(user.picture).to eq 'picture'
  end

  describe '#start_connection' do
    it 'makes a connection to a database' do
      expect(connect_database_class).to receive(:start)
      Users.start_connection(connect_database_class)
    end
  end

  describe 'Tests that need a connection' do

      before do
        Users.start_connection()
      end

    describe '#add' do
      it 'adds a user returns a user object' do
        expect(Users.add(
        username: user.username,
        password: user.password,
        age: user.age,
        gender: user.gender).class).to eq Users
      end
    end

    describe '#access_account' do
      it 'can return a Users object when correctly accessing and account' do
        Users.add(
        username: user.username,
        password: user.password,
        age: user.age,
        gender: user.gender)
        expect(Users.access_account(user.username,user.password).class).to eq Users
      end
      it "returns false when you incorrectly access_account" do
        expect(Users.access_account('fake username','fake password')).to eq false
      end
    end

    describe '#get_user' do
      it 'returns a user when passed an id' do
        Users.add(
        username: user.username,
        password: user.password,
        age: user.age,
        gender: user.gender)
        expect(Users.get_user(1).class).to eq Users
        expect(Users.get_user(1).id).to eq 1
      end
    end

    describe 'update_photo' do
      it 'sends a query to connection to update the photo' do
        Users.start_connection(connect_database_class)
        expect(connection).to receive(:query)
        Users.update_photo(1)
      end
    end

    describe 'get_photo' do
      it "can access the 'photo' information of a user" do
        allow(Kernel).to receive(:rand).and_return(1)
        Users.add(
        username: user.username,
        password: user.password,
        age: user.age,
        gender: user.gender)
        expect(Users.get_photo(1)).to eq("https://i.imgur.com/dzOMZgw.jpg")
      end
    end

end


end
