# frozen_string_literal: true

require 'peeps_manager'

RSpec.describe PeepsManager do
  let(:connection) { connection = PG.connect(dbname: 'chitter_test') }

  describe '#create_peep' do
    let(:user_email) { 'example@example.com' }

    it 'adds a new peep to the database' do
      subject.create_peep(test_peep, user_email)

      peep = connection.exec('SELECT peep FROM peeps;').first

      expect(peep['peep']).to eq test_peep
    end

    it 'adds a timestamp to the peep' do
      date_time_now = '2021-10-16T16:57:38+01:00'

      allow_any_instance_of(DateTime)
      .to receive(:to_s)
      .and_return(date_time_now)

      subject.create_peep(test_peep, user_email)

      peep = connection.exec('SELECT time FROM peeps;').first

      expect(peep['time']).to eq date_time_now
    end

    it 'adds a user email to the peep' do
      user_email = 'test@example.com'

      subject.create_peep(test_peep, user_email)

      peep = connection.exec('SELECT user_email FROM peeps;').first

      expect(peep['user_email']).to eq user_email
    end
  end

  describe '#all' do
    it 'returns all peeps in database' do
      populate_database

      peeps = subject.all

      expect(peeps.length).to eq 3
    end

    it 'returns peep object' do
      populate_database

      peep = subject.all.first

      expect(peep).to be_a Peep
    end

    it 'returns peep with peep message' do
      insert_peep_today_at(test_peep, '10:00:00')

      peep = subject.all.first.peep

      expect(peep).to eq test_peep
    end

    it 'returns peep with timestamp' do
      insert_peep_today_at(test_peep, '10:00:00')

      peep = subject.all.first.timestamp

      expect(peep).to eq 'Sat Oct 16 10:00:00 2021'
    end
  end

  describe '#all_in_time_order' do
    it 'returns all peeps in reverse chronological order' do
      populate_database
      connection.exec("INSERT INTO peeps(peep, time)
                       VALUES('test', '2021-06-22T10:00:00+01:00')
                       ;")

      peeps = subject.all_in_time_order

      result = peeps.map { |peep| peep.timestamp }

      expect(result).to eq [
        'Sat Oct 16 11:45:00 2021',
        'Sat Oct 16 10:00:00 2021',
        'Sat Oct 16 09:30:00 2021',
        'Tue Jun 22 10:00:00 2021'
      ]
    end
  end

  def populate_database
    insert_peep_today_at('Hello World', '10:00:00')
    insert_peep_today_at('I had bacon & eggs today', '09:30:00')
    insert_peep_today_at('Irelivant information', '11:45:00')
  end

  def insert_peep_today_at(peep, time)
    connection.exec("INSERT INTO peeps(peep, time)
                     VALUES('#{peep}', '2021-10-16T#{time}+01:00')
                     ;")
  end

  def test_peep
    'A test peep of a certain length (140 charaters)
to test the amount of text going to the database.
I really like icecream with cookie dough!!'
  end
end
