# frozen_string_literal: true

require 'peep'

RSpec.describe Peep do
  let(:datatime_string) { '2021-10-16T16:57:38+01:00' }
  let(:peep) { described_class.new('Irelivant', 'example@email.com', datatime_string) }

  it { expect(peep).to respond_to(:peep) }

  it { expect(peep).to respond_to(:time) }

  it { expect(peep).to respond_to(:user_email) }

  describe '#timestamp' do
    it 'returns a formated version of datatime string' do
      formated_time = 'Sat Oct 16 16:57:38 2021'

      expect(peep.timestamp).to eq formated_time
    end
  end
end
