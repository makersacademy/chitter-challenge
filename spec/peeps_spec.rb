# frozen_string_literal: true

require 'peeps'

describe Peeps do
  describe '.all' do
    it 'Returns a full list of peeps from the database' do
      expect(Peeps.all.count).to eq 4
    end
  end

  describe '.create' do
    it 'Adds another entry to the peep table' do
      expect { Peeps.create('Hello!','Catman','19:00') }.to change { Peeps.all.count }.by(1)
    end
  end
end
