require './app/models/peep.rb'
require 'database_helpers'

describe "#post" do
  it "Should allow user to post a peep" do
    message = 'This is my first peep'
    peep = Peep.post(message: 'This is my first peep')
    connection = PG.connect(dbname: 'chitter_test')
    p persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.text).to eq message
    end
  end
