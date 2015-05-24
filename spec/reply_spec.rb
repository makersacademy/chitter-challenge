require 'spec_helper'

describe Reply do

  context 'Checking DataMapper can create and delete entries' do

    it 'Should be created and retrieved from the db' do
      User.create(username: 'Big G',
                  name: 'Andy Gout',
                  email: 'example@test.com',
                  password: 'P0tat0M0nkey123!',
                  password_confirmation: 'P0tat0M0nkey123!')
      user1 = User.first
      User.create(username: 'Robbo',
                  name: 'Robert Bentley',
                  email: 'sample@test.com',
                  password: 'FirePanda789!',
                  password_confirmation: 'FirePanda789!')
      user2 = User.last
      Peep.create(text: 'Peep #1',
                  time: Time.now,
                  user_id: user1.id)
      peep = Peep.first
      expect(Reply.count).to eq(0)
      Reply.create(text: 'Reply #1',
                   time: Time.now,
                   user_id: user2.id,
                   peep_id: peep.id)
      expect(Reply.count).to eq(1)
      reply = Reply.first
      expect(reply.text).to eq('Reply #1')
      expect(reply.user_id).to eq(user2.id)
      expect(reply.peep_id).to eq(peep.id)
      reply.destroy
      expect(Reply.count).to eq(0)
    end

  end

end