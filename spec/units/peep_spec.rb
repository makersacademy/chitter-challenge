require 'peep'

describe Peep do
  describe '#initialisation' do
    subject { described_class.new(id: '1', text: 'Peep 1', time: '12:34:56') }
    it "has an id" do
      expect(subject.id).to eq '1'
    end

    it "has text" do
      expect(subject.text).to eq 'Peep 1'
    end

    it "has a time" do
      expect(subject.time).to eq '12:34:56'
    end

    it "has a username" do
      expect(subject.username).to eq 'anonymous'
    end
  end

  describe '.all' do
    it "should retrieve all peeps from the db in reverse chronological order" do
      DatabaseConnection.query("INSERT INTO
        peeps (id, text, time, username)
        VALUES
        ('1', 'This is peep 1', '10:45:00', 'Mario'),
        ('2', 'This is peep 2', '10:46:00', 'Luigi');"
      )

      expect(Peep.all[0].id).to eq '2'
      expect(Peep.all[1].id).to eq '1'
    end
  end

  # describe '.create' do
  #   it "adds a new peep to the database" do
  #     Peep.create(text: 'This is Peep 1',
  #       time: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}"
  #     )
  #   end
  # end
end
