# frozen_string_literal: true

require 'null_user'

RSpec.describe NullUser do
  describe '#email' do
    it 'returns a string describing no user' do
      expect(subject.email).to eq 'anonymouse'
    end
  end
end
