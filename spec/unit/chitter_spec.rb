require './lib/chitter'
require 'pg'

describe Chitter do
  describe '.chitter' do
    it 'should able to post' do
      chitter = Chitter.chitter_post(peep: 'First peep', user_id: 1)
      chitter.each do |row|
        expect(row['peep']).to eq 'First peep'
      end
    end
  end

  describe '.chitter_all' do
    it 'should list all peeps' do
      chitter = Chitter.chitter_post(peep: 'First peep', user_id: 1)
      Chitter.chitter_post(peep: 'Second peep', user_id: 1)
      Chitter.chitter_post(peep: 'Third peep', user_id: 1)

      peeps = Chitter.chitter_all

      peeps.each do |row|
        expect(row['created_on']).to eq Time.now.strftime('%H:%M')
      end
    end

  end

end
