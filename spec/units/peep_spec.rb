# frozen_string_literal: true

require 'peep'

RSpec.describe Peep do
  let(:datatime_string) { '2021-10-16T16:57:38+01:00' }
  let(:connection) { connection = PG.connect(dbname: 'chitter_test') }

  describe '.create_peep' do
    let(:user_email) { 'example@example.com' }

    it 'adds a new peep to the database' do
      described_class.create_peep(test_peep, user_email)

      peep = connection.exec('SELECT peep FROM peeps;').first

      expect(peep['peep']).to eq test_peep
    end

    it 'adds a timestamp to the peep' do
      date_time_now = '2021-10-16T16:57:38+01:00'

      allow_any_instance_of(DateTime)
      .to receive(:to_s)
      .and_return(date_time_now)

      described_class.create_peep(test_peep, user_email)

      peep = connection.exec('SELECT time FROM peeps;').first

      expect(peep['time']).to eq date_time_now
    end

    it 'adds a user email to the peep' do
      user_email = 'test@example.com'

      described_class.create_peep(test_peep, user_email)

      peep = connection.exec('SELECT user_email FROM peeps;').first

      expect(peep['user_email']).to eq user_email
    end
  end

  describe '.populate_peeps' do
    before(:each) do
      described_class.instance_variable_set(:@peeps, [])
    end

    it 'populates one database entry' do
      insert_peep_today_at(test_peep, '10:00:00')

      expect { described_class.populate_peeps }
      .to change { described_class.all_in_time_order.count }.from(0).to(1)
    end

    it 'populates all peeps from database' do
      populate_database
      peeps_count = connection.exec(
        'SELECT count(*) FROM peeps;'
      ).getvalue(0, 0).to_i

      expect { described_class.populate_peeps }
      .to change { described_class.all_in_time_order.count }
      .from(0).to(peeps_count)
    end

    it 'populates with peep object' do
      insert_peep_today_at(test_peep, '10:00:00')

      described_class.populate_peeps

      peep = described_class.all_in_time_order.first

      expect(peep).to be_a Peep
      expect(peep.peep).to eq test_peep
      expect(peep.timestamp).to eq 'Sat Oct 16 10:00:00 2021'
    end
  end

  describe '.all_in_time_order' do
    it 'returns an empty array when no peeps' do
      expect(described_class.all_in_time_order).to eq []
    end

    it 'does not populates peeps if already populated' do
      described_class.instance_variable_set(:@peeps, [Peep.new('', '', '')])
      allow(described_class).to receive(:populate_peeps)

      described_class.all_in_time_order

      expect(described_class).not_to have_received(:populate_peeps)
    end

    it 'returns all peeps in reverse chronological order' do
      populate_database
      connection.exec("INSERT INTO peeps(peep, time)
                       VALUES('test', '2021-06-22T10:00:00+01:00')
                       ;")

      peeps = described_class.all_in_time_order

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

  context 'when an instance of the class' do
    let(:new_peep) { described_class.new('Irelivant', 'example@email.com', datatime_string) }

    it { expect(new_peep).to respond_to(:peep) }

    it { expect(new_peep).to respond_to(:time) }

    it { expect(new_peep).to respond_to(:user_email) }

    describe '#timestamp' do
      it 'returns a formated version of datatime string' do
        formated_time = 'Sat Oct 16 16:57:38 2021'

        expect(new_peep.timestamp).to eq formated_time
      end
    end
  end
end
