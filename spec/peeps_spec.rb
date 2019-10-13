describe Peeps do

  subject(:peep) {described_class.new(1,'peep','date','username',0)}
  let(:user) {double :user,id: 1, username: 'username'}
  let(:connection) {double :connection, query: results}
  let(:results) {double :results, map: Array}
  let(:connect_database_class) {double :connect_database_class, start: connection}

  it "Knows it's id" do
    expect(peep.id).to eq 1
  end

  it "Knows the contents of the 'peep'" do
    expect(peep.peep).to eq 'peep'
  end

  it "Knows it's date" do
    expect(peep.date).to eq 'date'
  end

  it "Knows it's username" do
    expect(peep.username).to eq 'username'
  end

  it "knows how many loves" do
    expect(peep.loves).to eq 0
  end

  describe "#sign_in" do
    it 'Replaces username when a new user signs in' do
      Peeps.sign_in(user)
      expect(Peeps.current_user.username).to eq "username"
    end

    it 'Makes a connection to the database' do
      expect(connect_database_class).to receive(:start)
      Peeps.sign_in("test_username", connect_database_class)
    end
  end

  describe 'Tests that tests that need you to be signed in' do

    before do
      Peeps.sign_in(user)
    end

    describe "#view_all" do
      it 'Returns an empty array when no peeps have been made' do
        expect(Peeps.view_all).to eq []
      end

      it 'It returns a non empty array when peeps are added' do
        Peeps.add_peep("Hello", user.id)
        expect(Peeps.view_all.length).to eq 1
        expect(Peeps.view_all[0].peep).to eq "Hello"
      end
    end

    describe "#view_by_user" do

      it 'Returns an empty array when no peeps have been made' do
        expect(Peeps.view_by_user(user.id)).to eq []
      end

      it 'It returns a non empty array when a specific user makes a peep' do
        Peeps.add_peep("Hello", user.id)
        expect(Peeps.view_by_user(user.id).length).to eq 1
        expect(Peeps.view_by_user(user.id)[0].peep).to eq "Hello"
        expect(Peeps.view_by_user(user.id)[0].class).to eq Peeps
      end

    end

    describe '#loveit' do
      it 'Default love value is zero' do
        Peeps.add_peep("Hello", user.id)
        expect(Peeps.view_all[0].loves).to eq 0
      end

      it 'Increases the value by one' do
        Peeps.add_peep("Hello", user.id)
        Peeps.loveit(1)
        expect(Peeps.view_all[0].loves).to eq 1
      end
    end

    describe '#hateit' do
      it 'Decreaseds the value by one' do
        Peeps.add_peep("Hello", user.id)
        Peeps.hateit(1)
        expect(Peeps.view_all[0].loves).to eq -1
      end
    end

  end

end
