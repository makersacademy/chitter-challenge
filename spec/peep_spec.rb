require 'peep'

describe Peep do

  describe '.all' do
    it 'allows a user to view all peeps' do
      chitter = Peep.all

      expect(chitter).to include('This is my peep')
      expect(chitter).to include('This is my second peep')
      expect(chitter).to include('This is my third peep')
    end
  end

  describe '.create' do
    it 'allows user to create peeps' do
      Peep.create(peeps: 'new peep')

      expect(Peep.all).to include('new peep')
    end
  end

end


# if ENV['ENVIRONMENT'] == 'test'
#   connection = PG.connect(dbname: 'chitter_test')
# else
# connection = PG.connect(dbname: 'chitter')
# end
# result = connection.exec("SELECT * FROM chitterbase ORDER BY created_at ASC;")
# result.map do |peep|
#   Peep.new(id: peep['id'], peeps: peep['peeps'], created_at: peep['created_at'])
