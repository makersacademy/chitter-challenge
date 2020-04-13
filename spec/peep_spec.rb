require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do

      peep = Peep.create(content: '900 People die from Coronavirus')
      Peep.create(content: 'Lockdown is lifted')
      Peep.create(content: 'Coronavirus is over!')
      
      peeps = Peep.all
      
      expect(peeps[0]).to eq "900 People die from Coronavirus"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'Today is going to be a great day')
      persisted_data = persisted_data(id: peep.id)

      expect(Peep.all).to include 'Today is going to be a great day'
    end
  end
=begin
  describe 'including date and time' do
    it 'returns peep with date and time' do
      DatabaseConnection.query("INSERT INTO peeps (content, date) VALUES ('Lockdown is lifted', Date.now);")

      peeps = Peep.all

      expect(peeps).to include("Lockdown is lifted")
      expect(peeps.date). to be_kind_of(DateTime)
    end
  end
=end
end
