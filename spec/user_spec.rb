# frozen_string_literal: true

require 'user'

describe User do
  describe '.login' do
    it 'Sets the value of @@id to the passed number' do
      expect { User.login(2) }.to change { User.id }.from(nil).to(2)
    end
  end

  describe '.logout' do
    it 'Sets the value of @@id to nil' do
      expect { User.logout }.to change { User.id }.from(2).to(nil)
    end
  end

  describe '.username' do
    it 'Returns the username associated with @@id' do
      User.login(find_id_from_username('Wayne'))
      expect(User.username).to eq 'Wayne'
    end
  end

  describe '.request_login' do
    it 'Logs in with the supplied username and password if they match the database' do
      User.logout
      expect { User.request_login('Matt', 'password11') }.not_to change { User.username }
      expect { User.request_login('Matt', 'password111') }.to change { User.username }.from(nil).to('Matt')
    end
  end
end
