require 'peep'
require './lib/SessionHelpers'
include SessionHelpers

describe Peep do
  it 'should be created and then retrieved from the db' do
    expect(Peep.count).to eq(0)
    # this creates it in the database, so it's stored on the disk
    User.create(email: 'test@test.com',
                username: 'Mister_Test',
                name: 'Tasty Tester',
                password: 'test',
                password_confirmation: 'test')
    Peep.create(content: 'Hello world! This is a peep test!', 
                user_id: User.first.id)
    # We ask the database how many peeps we have, it should be 1
    expect(Peep.count).to eq(1)
    # Let's get the first (and only) Peep from the database
    peep = Peep.first
    # Now it has all properties that it was saved with.
    expect(peep.content).to eq('Hello world! This is a peep test!')
    # If we want to, we can destroy it
    peep.destroy
    # so now we have no links in the database
    expect(Peep.count).to eq(0)
  end

  xit 'can only be posted if a user is logged in' do
  end
end