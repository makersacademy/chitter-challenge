# frozen_string_literal: true

require 'quack'

describe '.all' do
  it 'returns a list of all quacks' do
    connection = PG.connect(dbname: 'duckboard_test')

    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Love is strength', 'Quackie');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Dream it, be it', 'T0ilet_duck');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('The last word', 'Duck_Tape');")
    
    quacks = Quack.all
    loadhour = Time.now.strftime("%F %H:")

    # expect(quacks.length).to eq 3
    expect(quacks.first).to be_a Quack
    # expect(quacks.first.id).to eq "1"
    expect(quacks.first.display_name).to eq 'Quackie'
    expect(quacks.first.message).to eq 'Love is strength'
    expect(quacks.first.time_stamp).to include loadhour
  end
end
