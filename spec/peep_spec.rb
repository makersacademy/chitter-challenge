require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      user = create_new_user
      peep = Peep.create(message: 'This is peep 1', user_id: user.id)
      Peep.create(message: 'MF peep 2', user_id: user.id)
      Peep.create(message: 'This is the third and final peep', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is peep 1'
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      user = create_new_user
      peep = Peep.create(message: 'This is my first peep', user_id: user.id)
      # persisted_data = persisted_data(id: bookmark.id)

      expect(peep).to be_a Peep
      expect(peep.id.to_i).to be_a Integer
      expect(peep.message).to eq('This is my first peep')
    end
  end

  describe '.delete' do 
    it 'removes a peep from the feed' do 
      user = create_new_user
      peep = Peep.create(message: 'New peep', user_id: user.id)

      Peep.delete(id: peep.id)
      expect(Peep.all.length).to eq 0
    end
  end

  describe '.find' do
    it 'returns the requested peep object' do
      user = create_new_user
      peep = Peep.create(message: 'A peep', user_id: user.id)

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq(peep.id)
      expect(result.message).to eq 'A peep'
    end
  end

  describe '.update' do 
    it 'allows the editting of a peep' do 
      user = create_new_user
      peep = Peep.create(message: 'Hello world', user_id: user.id)
      updated_peep = Peep.update(id: peep.id, message: 'Goodbye world')

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq peep.id
      expect(updated_peep.message).to eq 'Goodbye world'
    end
  end

  describe '.find_users_name' do 
    it 'returns the name of user who wrote a peep' do 
      user = create_new_user
      peep = Peep.create(message: 'Hello world', user_id: user.id)

      expect(peep.find_users_name).to eq 'Ollie'
    end
  end

  describe '.find_users_username' do 
    it 'returns the username of user who wrote a peep' do 
      user = create_new_user
      peep = Peep.create(message: 'Hello world', user_id: user.id)
      expect(peep.find_users_username).to eq 'ob'
    end
  end

  describe '.show_date' do 
    it 'returns the date in a readable string format' do 
      user = create_new_user
      peep = Peep.create(message: 'Hello world', user_id: user.id, time_last_altered: "2021-04-06 17:29:48")
      expect(peep.show_date).to eq '06/04/21 at 17:29'
    end
  end
end
