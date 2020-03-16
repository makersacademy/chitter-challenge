require './lib/peep'
require_relative 'database_helpers'

describe Peep do
  describe ".all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('email@email.com', 'password', 'will', 'itswill') RETURNING id;")
      connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', 'I just ate an apple', '#{result[0]['id']}');")
      connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', 'Chitter is the best', '#{result[0]['id']}');")
      connection.exec("INSERT INTO peeps (time, text, user_id) VALUES ('#{Time.now}', 'Howdy', '#{result[0]['id']}');")
      peeps = Peep.all

      expect(peeps[0].text).to eq("I just ate an apple")
      expect(peeps[1].text).to eq("Chitter is the best")
      expect(peeps[2].text).to eq("Howdy")
    end
  end

  describe ".create" do
    it "can create a peep" do
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('email@email.com', 'password', 'will', 'itswill') RETURNING id;")
      peep = Peep.create(user_id: result[0]['id'], text: 'This is a peep woo')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq "This is a peep woo"
    end
  end

end
