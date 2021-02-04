require './lib/users'

describe Users do

  describe 'self.create' do
    it 'creates a new Peep entry in chitter database' do
      new_user = Users.create('Big day at Makers')
      expect(new_user).to be_a Users
    end
  end
end



