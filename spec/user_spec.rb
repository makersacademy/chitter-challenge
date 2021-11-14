# frozen_string_literal: true

require 'user'

describe User do
  before(:each) { User.logout }

  describe '.all' do
    it 'Returns a full list of users from the database' do
      expect(User.all.count).to eq 6
    end
  end

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
      User.login(find_id_from_username('Demon'))
      expect(User.username).to eq 'Demon'
    end
  end

  describe '.fullname' do
    it 'Returns the username associated with @@id' do
      User.login(find_id_from_username('Demon'))
      expect(User.fullname).to eq 'Gene Simmons'
    end
  end

  describe '.request_login' do
    it 'Logs in with the supplied username and password if they match the database' do
      expect { User.request_login('Matt', 'password11') }.not_to change { User.username }
      expect { User.request_login('Matt', 'password') }.to change { User.username }.from('none').to('Matt')
    end
  end

  describe '.create' do
    it 'Adds another entry to the user table' do
      expect { User.create('ankh@gmail.com','password','Vinnie Vincent','Ankh Warrior') }.to change { User.all.count }.by(1)
    end
  end

  let(:timestamp_0825) { double('timestamp 08:25', :hour => 8, :min => 25, :day => 5, :month => 11, :year => 2021 )}

  describe '.time' do
    it 'Returns a formatted time' do
      expect(User.time(timestamp_0825)).to eq '08:25, 05/11/2021'
    end
  end
end
