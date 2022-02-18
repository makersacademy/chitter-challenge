# frozen_string_literal: true

require 'null_user'

RSpec.describe NullUser do
  describe '#email' do
    it 'returns a string describing no user' do
      expect(subject.email).to eq 'anonymouse'
    end
  end

  describe '#id' do
    it 'returns nil' do
      expect(subject.id).to be_nil
    end
  end

  describe '#log_button' do
    it 'returns parameters for log out button' do
      parameters = {
        label: 'Log In',
        name: 'log-in',
        path_action: '/sessions/new'
      }

      expect(subject.log_button).to eq parameters
    end
  end
end
