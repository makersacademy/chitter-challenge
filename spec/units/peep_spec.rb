require 'peep'

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(name: 'Josie', email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: 'The news is depressing', user_id: user.id)
      all_peeps = DatabaseConnection.query("SELECT * FROM peeps;")
      expect(peep).to be_a Peep
      expect(peep.id).to eq all_peeps.first['id']
      expect(peep.peep).to eq 'The news is depressing'
      expect(peep.date).to eq DateTime.strptime(all_peeps.first['date'], '%Y-%m-%d %H:%M:%S').strftime("%d %b %Y %k:%M")
      expect(peep.user_name).to eq 'Josie'
    end
  end

  describe '.all' do
    it 'creates a list of peep instances in chronological order' do
      user = User.create(name: 'Josie', email: 'test@example.com', password: 'password123')
      Peep.create(peep: 'The news is depressing', user_id: user.id)
      Peep.create(peep: 'And yet my cats are unfazed', user_id: user.id)

      peep = Peep.all
      # p peep
      expect(peep.first.peep).to eq 'And yet my cats are unfazed'
    end
  end


end
