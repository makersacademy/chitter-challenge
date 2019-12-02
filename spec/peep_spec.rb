require 'peep'
require_relative './database_helper'

describe Peep do
  before(:each) do
    setup_test_database
  end
  describe '.all' do
    it 'returns all peeps posted and user_handles' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (user_handle, post) VALUES ('leonardo_dicaprio','Hello World!');")
      # connection.exec("INSERT INTO peeps (user_handle, post) VALUES ('meryl_streep','I am feeling sunny today!');")
      # connection.exec("INSERT INTO peeps (user_handle, post) VALUES ('bob','Minions will takeover the world.');")

      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.user_handle).to eq('leonardo_dicaprio')
      expect(peeps.first.post).to eq("Hello World!")
      # expect(peeps).to include("leonardo_dicaprio","Hello World!")
      # expect(peeps).to include("meryl_streep","I am feeling sunny today!")
      # expect(peeps).to include("bob", "Minions will takeover the world.")
    end
  end
end
