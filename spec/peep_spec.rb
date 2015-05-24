require 'spec_helper'
require 'helpers/user_helpers'

describe Peep do

  context 'can create a' do

    it 'public peep' do
      peep = described_class.create(message: 'Hello world',
                                    time: Time.now,
                                    user_id: '1',
                                    receiver: 'public')
      expect(peep.save).to be_truthy
    end

    it 'private peep' do
      peep = described_class.create(message: 'Hello world',
                                    time: Time.now,
                                    user_id: '1',
                                    receiver: 'John')
      expect(peep.save).to be_truthy
    end
  end

  context 'cannot create a peep' do

    it 'with length less than 1 character' do
      peep = described_class.create(message: '',
                                    time: Time.now,
                                    user_id: '1',
                                    receiver: 'public')
      expect(peep.save).to be_falsey
    end
    it 'with length more than 140 characters' do
      peep = described_class.create(message: 'A' * 141,
                                    time: Time.now,
                                    user_id: '1',
                                    receiver: 'public')
      expect(peep.save).to be_falsey
    end
  end
end