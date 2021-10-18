require 'peep'
require 'database_helpers'
require 'timecop'

describe Peep do
  after { Timecop.return } # resets the time to real time

  describe '.all' do
    it 'returns an array of all peeps' do
      user = User.create( # is there a way to DRY this?
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )
      Peep.create(text: 'Other tweet', author: user.id)
      Peep.create(text: 'Another tweet', author: user.id)
      peep = Peep.create(text: 'Test tweet', author: user.id)
      peeps = Peep.all
      
      expect(peeps.length).to eq(3)
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'Test tweet' # the last tweet made is the first in the array
      # storing peep time isn't tested here as it is tested elsewhere
    end

    it 'is sorted in reverse chronological order' do
      user = User.create(
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )

      [2019,2020,2021].each do |year|
        Timecop.freeze(Time.new(year))
        Peep.create(text: "Test tweet #{year}", author: user.id)
      end
      peeps = Peep.all

      expect(peeps.first.time).to eq Timecop.freeze(Time.utc(2021))
      expect(peeps.first.text).to eq "Test tweet 2021"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )
      time = Timecop.freeze(Time.new(2021))
      peep = Peep.create(text: 'Test tweet', author: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      # persisted_data queries the database and checks what is actually stored

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'Test tweet'
      expect(peep.time).to eq time
      expect(peep.author).to eq user.id
      # replying_to can be NULL
    end
  end

  describe '.replies' do
    it 'returns an array of all replies to a specific peep' do
      user1 = User.create(
        first_name: 'Test', last_name: 'User', username: 'test1',
        email: 'test1@test.com', password: '12345'
      )
      user2 = User.create(
        first_name: 'Test', last_name: 'User', username: 'test2',
        email: 'test2@test.com', password: '12345'
      )
      user3 = User.create(
        first_name: 'Test', last_name: 'User', username: 'test3',
        email: 'test3@test.com', password: '12345'
      )
      
      peep = Peep.create(text: 'Test tweet', author: user1.id)
      reply_peep1 = Peep.create(text: 'Reply tweet1', author: user2.id, peep: peep.id)
      reply_peep2 = Peep.create(text: 'Reply tweet2', author: user3.id, peep: peep.id)
      replies = Peep.replies(id: peep.id)

      expect(replies.length).to eq(2)
      expect(replies.first.id).to eq reply_peep2.id
      expect(replies.first.text).to eq 'Reply tweet2' # newest first
    end
  end
end
