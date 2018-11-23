require_relative '../../lib/database_connection'
require_relative '../../lib/models/peep'
describe Peep do
  context '#all' do
    it 'can retrieve all peeps' do
      10.times do |num|
        DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('This is a test peep #{num}')")
      end
      expect(Peep.all[7].content).to include ('This is a test peep 7')
    end
  end

 # context '#create' do
 #   it 'creates a new peep' do
 #     content = 'This is a test peep.'
 #     Peep.create(content: content)
 #     expect(Peep.all).to include content
 #   end
 # end
end
