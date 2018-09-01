# peep_spec.rb

describe Peep do
  describe '.create' do
    it 'saves a new peep to the database' do
      peep = Peep.create('This is a test', 1)
      expect(peep).to be_a Peep
      expect(peep.text).to eq 'This is a test'
    end

    it 'saves the time when the peep was posted' do
      peep = Peep.create('This is a test', 1)
      formatted_time = Time.now.strftime("%I:%M%p on %m/%d/%Y")
      expect(peep.time).to eq formatted_time
    end
  end

  describe '.all' do
    it 'returns all the peeps as an array of Peep objects in reverse order' do
      info = { "name" => "Dave", "email" => "dave@dave.com", "password" => "pw123", "username" => "dave123" }
      current_user = User.signup(info)
      Peep.create('test1', current_user.id)
      Peep.create('test2', current_user.id)
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.text).to eq 'test2'
      expect(peeps.first.username).to eq 'dave123'
    end
  end

end
