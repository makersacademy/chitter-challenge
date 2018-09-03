require 'peep'

describe Peep do

  describe '.all' do
    it 'displays all peeps from a database' do
      expect(Peep.all).to include Peep
    end

  end

  describe '.create_peep' do
    it 'sends an sql query to DatabaseConnection' do
      content = '.create_peep test'
      author_id = 75
      expect(DatabaseConnection).to receive(:query).with("INSERT INTO peeps (content, author_id) VALUES ('#{content}', '#{author_id}')")

      Peep.create_peep(content, author_id)
    end

  end


end
