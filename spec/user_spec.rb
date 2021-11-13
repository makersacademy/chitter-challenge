# frozen_string_literal: true

require 'user'

describe User do
  before(:each) { User.logout }

  describe '.login' do
    it 'Sets the value of @@id to the passed number' do
      expect { User.login(2) }.to change { User.id }.from(nil).to(2)
    end
  end

  describe '.logout' do
    it 'Sets the value of @@id to nil' do
      User.login(2)
      expect { User.logout }.to change { User.id }.from(2).to(nil)
    end
  end

  describe '.username' do
    it 'Returns "none" if not logged in' do
      expect(User.username).to eq 'none'
    end

    it 'Returns the username associated with @@id' do
      User.login(find_id_from_username('Wayne'))
      expect(User.username).to eq 'Wayne'
    end
  end

  describe '.fullname' do
    it 'Returns the username associated with @@id' do
      User.login(find_id_from_username('Wayne'))
      expect(User.fullname).to eq 'Wayne Campbell'
    end
  end

  describe '.request_login' do
    it 'Logs in with the supplied username and password if they match the database' do
      expect { User.request_login('Matt', 'password11') }.not_to change { User.username }
      expect { User.request_login('Matt', 'password111') }.to change { User.username }.from('none').to('Matt')
    end
  end
end
