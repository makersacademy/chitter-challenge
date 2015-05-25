require 'spec_helper'

describe Peep do

  context 'Checking DataMapper can create and delete entries' do

    it 'Should be created and retrieved from the db' do
      User.create(username: 'Big G',
                  name: 'Andy Gout',
                  email: 'example@test.com',
                  password: 'P0tat0M0nkey123!',
                  password_confirmation: 'P0tat0M0nkey123!')
      user = User.first
      expect(Peep.count).to eq(0)
      Peep.create(text: 'Peep #1',
                  time: Time.now,
                  user_id: user.id)
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.text).to eq('Peep #1')
      expect(peep.user_id).to eq(user.id)
      peep.destroy
      expect(Peep.count).to eq(0)
    end

  end

end