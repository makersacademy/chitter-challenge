require 'peep'
require 'user'

describe Peep do

  describe 'creation of a new peep' do

    it 'contains a message body' do
      message = "I'm a peep message body"
      peep = Peep.create(message: message)
      expect(peep.message).to eq message
    end

    it 'knows when it was created' do
      message = "I'm a peep message body"
      time = "#{Time.now.hour}" + ":" + "%02d" % Time.now.min.to_s
      peep = Peep.create(message: message)
      expect(peep.created_at.to_s).to include(time)
    end

    it 'has a user who created it' do
      user = User.create(name: 'test', username: 'test', email: 'test@test.com', password_hash: PasswordManager.hash('pass'))
      message = "I'm a peep message body"
      peep = Peep.create(message: message, user_id: user.id)
      expect(peep.user_id).to eq(user.id)
    end

    it 'recognises when a user has been tagged' do
      user = User.create(name: 'test', username: 'test', email: 'test@test.com', password_hash: PasswordManager.hash('pass'))
      User.create(name: 'prince', username: 'pj', email: 'prince@fake.com', password_hash: PasswordManager.hash('pass'))
      message = "I'm tagging @pj in this peep"
      peep = Peep.create(message: message, user_id: user.id)
      expect(Peep.tag?(peep)).to eq('pj')
    end

  end





end