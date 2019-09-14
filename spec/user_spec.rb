require 'features/web_helpers'
require 'user'

describe User do

  describe '#self.create' do
    it 'creates a new User entry in user db' do
      delete_db_rows
      user = User.create(name: 'John1', email: 'John1150@hotmail.com', password: 'huge secret', handle: 'BigJohn1452')

      expect(user).to be_a User
      expect(user.name).to eq 'John1'
      expect(user.email).to eq 'John1150@hotmail.com'
      expect(user.handle).to eq 'BigJohn1452'
    end
  end

end
