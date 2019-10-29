# frozen_string_literal: true

require 'database_helpers'
require 'chitter'

describe Chitter do
  before(:each) do
    @result =
      create_new_user_sql(
        username: 'TestUser',
        email: 'TestEmail@Test.com',
        password: 'TestPassword'
      ).first
  end

  describe '.sign_up' do
    context 'username exists' do
      it 'returns username used' do
        result = described_class.sign_up(username: 'TestUser', email: 'TestEmail2@Test.com', password: 'TestPassword')

        expect(result).to eq 'username used'
      end
    end

    context 'email exists' do
      it 'returns username used' do
        result = described_class.sign_up(username: 'TestUser2', email: 'TestEmail@Test.com', password: 'TestPassword')

        expect(result).to eq 'email used'
      end
    end

    context 'username and email dont exist' do
      it 'returns a User class' do
        result = described_class.sign_up(username: 'TestUser2', email: 'TestEmail2@Test.com', password: 'TestPassword')

        expect(result.username).to eq 'TestUser2'
      end
    end
  end

  describe '.log_in' do
    it 'checks user exists' do
      
    end

    # it 'calls #log_in on an instance user class' do
    #
    # end
  end
end
