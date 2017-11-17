require './app/models/user'
require 'bcrypt'

describe User do
  subject do
    described_class.new(
      password: 'a', 
      password_confirmation: 'b',
      name: 'name',
      handle: 'handle'
    )
  end

  describe '#password' do
    context 'when creating digest attribute' do
      after(:each) do 
        described_class.new(password: 'a', password_confirmation: 'b')
      end

      it 'encrypts password' do
        expect(BCrypt::Password).to receive(:create).with('a')
      end 
    end

    context 'after password encryption' do
      it 'sets @password' do
        expect(subject.password).to eq 'a'
      end
    end
  end
end
