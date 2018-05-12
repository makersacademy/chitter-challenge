require 'pg'
require 'spec_helper'
require 'user'

describe User do

  describe '.create' do
    it 'should create a new peep user' do
      test_user = User.create(username: "Peeping Sally", password: 'helikespeeping')
      expect(User.all).to include test_user
    end
  end

end
