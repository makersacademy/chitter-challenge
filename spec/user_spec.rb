require 'spec_helper'
require 'helpers/user_helpers'

describe User do

  it { is_expected.to respond_to(:password=).with(1).argument }

  context 'can create an acount' do

    it 'with a unique email and username' do
      user = described_class.create(email: 'test@test.com',
                                    password: '123',
                                    password_confirmation: '123',
                                    name: 'John',
                                    username: 'John1')
      expect(user.save).to be_truthy
    end

  end

  context 'cannot leave blank' do

    it 'username' do
      user = described_class.create(email: 'test@test.com',
                                    password: '123',
                                    password_confirmation: '321',
                                    name: 'Jack',
                                    username: '')
      expect(user.save).to be_falsey
    end
    it 'name' do
      user = described_class.create(email: 'test@test.com',
                                    password: '123',
                                    password_confirmation: '321',
                                    name: '',
                                    username: 'Jack1')
      expect(user.save).to be_falsey
    end
    it 'email' do
      user = described_class.create(email: '',
                                    password: '123',
                                    password_confirmation: '321',
                                    name: 'Jack',
                                    username: 'Jack1')
      expect(user.save).to be_falsey
    end
    it 'password' do
      user = described_class.create(email: 'test@test.com',
                                    password: '',
                                    password_confirmation: '',
                                    name: 'Jack',
                                    username: 'Jack1')
      expect(user.save).to be_falsey
    end

  end

  context 'cannot create an account if' do

    before(:each) do
      user = described_class.create(email: 'test@test.com',
                                    password: '123',
                                    password_confirmation: '123',
                                    name: 'John',
                                    username: 'John1')
    end

    it 'passwords do not match' do
      user = described_class.create(email: 'newtest@test.com',
                                    password: '123',
                                    password_confirmation: '321',
                                    name: 'Jack',
                                    username: 'Jack')
      expect(user.save).to be_falsey
    end
    it 'the username is already taken' do
      user = described_class.create(email: 'newtest@test.com',
                                    password: '123',
                                    password_confirmation: '123',
                                    name: 'John',
                                    username: 'John1')
      expect(user.save).to be_falsey
    end
    it 'the email is already taken' do
      user = described_class.create(email: 'test@test.com',
                                    password: '123',
                                    password_confirmation: '123',
                                    name: 'Jack',
                                    username: 'Jack1')
      expect(user.save).to be_falsey
    end
  end
end