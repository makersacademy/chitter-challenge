describe Peep do
  let(:peep) { Peep.create(body: 'My first peep') }
  let(:persisted_data) { Peep.find_by id: peep.id }

  describe '.create' do
    it 'creates a peep' do
      expect(peep).to be_a Peep
      expect(peep.body).to eq 'My first peep'
      expect(peep.id).to eq persisted_data.id
    end
  end

  describe 'user details' do
    let(:user) { User.create(username: 'username', name: 'name') }
    let(:user_peep) { user.peeps.create(body: 'My first peep') }

    it 'finds the username of the post author' do
      expect(user_peep.username).to eq 'username'
    end

    it 'finds the name of the user' do
      expect(user_peep.author).to eq 'name'
    end
  end
end
