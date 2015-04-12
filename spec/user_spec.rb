require 'spec_helper'

describe User do
  context 'can add a user record to the database' do
    it 'expects to be created and then retrieved from the db' do
      expect(described_class.count).to eq(0)
      described_class.create(name: 'Rob',
                             handle: '@rbgeorob',
                             email: 'rob@test.com',
                             password: 'hello')
      expect(described_class.count).to eq(1)
      user = described_class.first
      expect(user.name).to eq('Rob')
      expect(user.handle).to eq('@rbgeorob')
    end
  end
end