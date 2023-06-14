require 'peep'

RSpec.describe Peep do

  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end

  context 'when given valid text and user_id' do

    it 'should add a new peep to the database' do
      text = "Hello, starting my chitter:)!"
      user_id = 1
      expect{ Peep.create(text, user_id) }.to change{ Peep.all.length }.by(1)
    end

    it 'should return a new Peep object with correct attributes' do
      text = "Hello, starting my chitter:)!"
      user_id = 1
      peep = Peep.create(text, user_id)
      expect(peep).to be_instance_of(Peep)
      expect(peep.text).to eq(text)
      expect(peep.user_id).to eq(user_id)
    end
  end

  context '#all' do
    it 'should return an array of Peep objects' do
      peeps = Peep.all
      expect(peeps).to be_instance_of(Array)
      expect(peeps.first).to be_instance_of(Peep)
    end

    it 'should return all peeps in the database in reverse order of creation' do
      peeps = Peep.all
      expect(peeps.length).to eq(3)
      expect(peeps[0].text).to eq('Excited to start my new job tomorrow')
      expect(peeps[1].text).to eq('Just finished my first marathon!')
      expect(peeps[2].text).to eq('Hello, starting my chitter:)!')
    end
  end

  context '#user' do
    it 'should return the User object associated with the Peep' do
      peep = Peep.all.first
      user = peep.user
      expect(user).to be_instance_of(User)
      expect(user.id).to eq(peep.user_id)
    end
  end
end