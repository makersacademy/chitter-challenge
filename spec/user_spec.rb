require 'spec_helper'

describe User do

  context 'Demonstration of how chitter database works' do

    it 'should be created and then retrieved from the db' do
      expect(User.count).to eq(0)
      User.create(email: 'rizcube@gmail.com',
                  name: 'rizwan',
                  user_name: 'riz')
      expect(User.count).to eq(1)
      user = User.first

      expect(user.email).to eq('rizcube@gmail.com')
      expect(user.name).to eq('rizwan')
      expect(user.user_name).to eq('riz')

      user.destroy
      expect(User.count).to eq(0)
    end


  end


end