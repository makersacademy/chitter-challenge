require 'peep'
require 'peep_repository'

RSpec.describe PeepRepository do
  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect('chitter_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end

  context 'Peep Managment' do
    it "creates new peep, adds to database" do
      repo = PeepRepository.new
      timestamp = '2023-04-11 21:23:03.916851'
      new_peep = Peep.new("TGIF everyone!", timestamp, 1)

      expect(repo.create(new_peep)).to eq true
    end

    it "returns all peeps by a user id" do
      repo = PeepRepository.new
      new_peep = Peep.new("TGIF everyone!", '2023-04-11 21:23:03.916851', 1)
      repo.create(new_peep)

      peeps_to_check = ["Just finished a great workout! #sweatyselfie",
      "TGIF everyone!"]

      result = repo.find(1)
      expect(result[0].content).to eq peeps_to_check[0]   
      expect(result[1].content).to eq peeps_to_check[1]   
    end

    it "returns all peeps" do
      repo = PeepRepository.new
      check_peeps = [
        'Just finished a great workout! #sweatyselfie',
        'Why is it still night time?',
        'Has anyone else noticed the strange creatures lurking around here?'
      ]
      result = repo.all

      expect(result.length).to eq 3
      expect(result[0].content).to eq check_peeps[0]
      expect(result[1].content).to eq check_peeps[1]
      expect(result[2].content).to eq check_peeps[2]
    end

    it "returns all peeps in reverse order of creation" do
      repo = PeepRepository.new
      check_peeps = [
        'Just finished a great workout! #sweatyselfie',
        'Why is it still night time?',
        'Has anyone else noticed the strange creatures lurking around here?'
      ]
      result = repo.ordered

      expect(result.length).to eq 3
      expect(result[0].content).to eq check_peeps[0]
      expect(result[1].content).to eq check_peeps[1]
      expect(result[2].content).to eq check_peeps[2]
    end

    it "returns a single peep" do
      repo = PeepRepository.new
      peep_check = 'Why is it still night time?'
      result = repo.return_single_peep(2)
      expect(result.content).to eq peep_check
    end
  end
end
