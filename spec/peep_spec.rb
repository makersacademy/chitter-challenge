# frozen_string_literal: true

require 'database_helpers'
require 'peep'

describe Peep do
  before(:each) do
    @result =
      create_new_user_sql(
        username: 'TestUser',
        email: 'TestEmail@Test.com',
        password: 'TestPassword'
      ).first
    @time = Time.new
  end

  let(:user) { double :bookmark, id: @result['id'], username: @result['username'], email: @result['email'], password: @result['password'] }

  describe '.create' do
    it 'creates a new peep for a given user' do
      peep = described_class.create(content: 'Test Peep', user_id: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a described_class
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'Test Peep'
      expect(peep.date).to eq @time.strftime("%d/%m/$Y")
      expect(peep.time).to eq @time.strftime("%H:%M")
      expect(peep.user_id).to eq user.id
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      peep = described_class.create(content: 'Test Peep 1', user_id: user.id)
      described_class.create(content: 'Test Peep 2', user_id: user.id)
      described_class.create(content: 'Test Peep 3', user_id: user.id)

      peeps = described_class.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a described_class
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Test Peep 1'
      expect(peeps.first.date).to eq @time.strftime("%d/%m/$Y")
      expect(peeps.first.time).to eq @time.strftime("%H:%M")
      expect(peeps.first.user_id).to eq user.id
    end
  end
end
