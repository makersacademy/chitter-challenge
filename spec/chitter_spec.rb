require 'chitter'
require 'database_helpers'
require './lib/database_connection.rb'

describe Peep do

  it 'shows a list of all the peeps' do
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("TRUNCATE users, peeps;")
    connection.query("INSERT INTO users (email,password,name,username) VALUES ('lucaf@gmail.com','password', 'luca', 'luca89');")
    peep = Peep.create(message: 'new_message', username_id: 'luca89')
    result = Peep.all
    expect(result.length).to eq 1
    expect(result[0].message).to eq 'new_message'
    expect(result[0].username).to eq 'luca89'
  end

  # it 'creates a new peep' do
  #   connection = PG.connect(dbname: "chitter_test")
  #   connection.exec("TRUNCATE users, peeps;")
  #   peep = Peep.create(message: 'new_message', username_id: 'luca89')
  #   expect(result[0].message).to eq 'new_message'
  #   expect(result[0].username).to eq 'luca89'
  # end


end
