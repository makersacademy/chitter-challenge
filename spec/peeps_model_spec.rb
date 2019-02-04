require 'peeps'
require 'web_helper.rb'

describe Chitter do
  before :each do
    Webhelper.reset
    # add_dummy_data
  end

  connection = PG.connect(dbname: ENV['DATABASE'])

  describe '.all' do
    it 'returns all peeps in database' do
      # Peeps.create('This is my first peep')
      peeps = Peeps.all
      p peeps.message
      expect(peeps.message).to include('This is my first peep')
    end
  end
end
