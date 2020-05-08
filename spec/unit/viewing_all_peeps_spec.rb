require 'spec_helper'
require 'peep'

describe Peep do
  describe '.all' do
    it "returns all peeps" do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (message) VALUES ('Message 1');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 2');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 3');")

    peeps = Peep.all 

    expect(peeps).to include('Message 1')
    expect(peeps).to include('Message 2')
    expect(peeps).to include('Message 3')
    end
  end
end