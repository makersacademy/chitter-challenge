require 'spec_helper'

describe User do
  
  context 'Demonstration of how datamapper works for users' do

    it 'should be created and then retrieved from the db' do
      User.create(  email: 'phoebe@phoebeh.com',
                    username: 'phoebe')
      expect(User.count).to eq(1)
      user = User.first
      expect(user.email).to eq('phoebe@phoebeh.com')
      expect(user.username).to eq('phoebe')
    end

  end
end
