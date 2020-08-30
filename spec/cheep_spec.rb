require 'chitter'


describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
    connection = PG.connect(dbname: 'chitter_test')

    cheep = Cheep.create(cheep: 'Hello Chitter!')
    Cheep.create(cheep: 'What shall I eat for dinner?')
    Cheep.create(cheep: ':)')


    cheeps = Cheep.all 

    expect(cheeps.length).to eq 3
    expect(cheeps.first).to be_a Cheep
    expect(cheeps.first.id).to eq cheep.id
    expect(cheeps.first.cheep).to eq 'Hello Chitter!'
    expect(cheeps.first.timestamp).to eq "#{Time.now}" 
    end
  end

  describe '.create' do
    it 'creates a new cheep' do
      cheep = Cheep.create(cheep: 'Good morning!')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM chitter WHERE id = #{cheep.id};")

      expect(cheep).to be_a Cheep
      expect(cheep.id).to eq persisted_data.first['id']
      expect(cheep.cheep).to eq 'Good morning!'
      expect(cheep.timestamp).to eq "#{Time.now}"
    end
  end
end