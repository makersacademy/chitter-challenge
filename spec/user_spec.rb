require 'spec_helper'

describe User do

  context 'Checking DataMapper can create and delete entries' do

    it 'Should be created and retrieved from the db' do
      expect(User.count).to eq(0)
      User.create(username: 'Big G',
                  name: 'Andy Gout',
                  email: 'example@test.com',
                  password: 'P0tat0M0nkey123!',
                  password_confirmation: 'P0tat0M0nkey123!')
      expect(User.count).to eq(1)
      user = User.first
      expect(user.username).to eq('Big G')
      expect(user.name).to eq('Andy Gout')
      expect(user.email).to eq('example@test.com')
      user.destroy
      expect(User.count).to eq(0)
    end

  end

end