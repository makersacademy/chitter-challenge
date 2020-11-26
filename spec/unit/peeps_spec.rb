require './lib/peeps'

describe Peeps do
  let(:peeps) { Peeps.new(id: "1", username: "usernametest", peep: "peeptest", lastmodified: "lastmodifiedtest") }

  describe '#initialize' do
    it 'Is an instance of Peep' do
      expect(peeps).to be_a Peeps
    end

    it "Instances respond to the .id method" do
      expect(peeps.id).to eq "1"
    end

    it "Instances respond to the .username method" do
      expect(peeps.username).to eq "usernametest"
    end

    it "Instances respond to the .peep method" do
      expect(peeps.peep).to eq "peeptest"
    end

    it "Instances respond to the .lastmodified method" do
      expect(peeps.lastmodified).to eq "lastmodifiedtest"
    end
  end

  describe '.all' do
    it 'Returns a ruby object containing information from the SQL database' do
      
      Peeps.create(username: 'rorschach12', peep: 'I am not sure if I am qualified to be doing this')
      Peeps.create(username: 'SlowSally123', peep: 'SQL is quite hard eh?!')
      Peeps.create(username: 'AndyH21', peep: 'Why. Just why.')

      peeps = Peeps.all

      expect(peeps.first.username).to eq "rorschach12"
      expect(peeps.first.peep).to eq "I am not sure if I am qualified to be doing this"
      expect(peeps.first.lastmodified).to eq Time.now.strftime("%d/%m/%Y %k:%M")
      expect(peeps.length).to eq 3
    end
  end

  describe '.create' do
    it "Adds a new entry to the database" do
      Peeps.create(username: "Test", peep: "Test peep")
      peeps = Peeps.all
      expect(peeps.first.id).not_to eq nil
      expect(peeps.first.username).to eq "Test"
      expect(peeps.first.peep).to eq "Test peep"
    end
  end

  # describe '#time_formatter' do
  #   it "Formats the time" do
  #     connection = DatabaseConnection.setup('chitter_test')
  #     Peeps.create(username: 'rorschach12', peep: 'I am not sure if I am qualified to be doing this')
  #     peeps = Peeps.all
  #     peeps.first.lastmodified

  # #   end
  # end

end
