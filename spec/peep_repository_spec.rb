require "peep_repository"

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  xit "Get all peeps in reverse chronological order" do
    peep_repository = PeepRepository.new
    peeps = peep_repository.all

    expect(peeps.length).to eq 3

    expect(peeps.first.id).to eq 5
    expect(peeps.first.contents).to eq "My third peep"
    expect(peeps.first.time_placed).to eq "2022-11-03 07:13:49"
    expect(peeps.first.account_id).to eq 1

    expect(peeps.first.id).to eq 1
    expect(peeps.first.contents).to eq "My first peep"
    expect(peeps.first.time_placed).to eq "2022-11-01 16:00:00"
    expect(peeps.first.account_id).to eq 1
  end

  xit "Find a peep with a specific id" do
    peep_repository = PeepRepository.new
    peep = peep_repository.find(4)

    expect(peeps.id).to eq 4
    expect(peeps.contents).to eq "Test"
    expect(peeps.time_placed).to eq "2022-11-02 16:00:30"
    expect(peeps.account_id).to eq 3
  end

  xit "#find fails with an IndexError when given an id that doesn't exist" do
    peep_respository = PeepRepository.new
    error_message = "There is no peep with ID 6"
    expect { peep_repository.find(6) }.to raise_error IndexError error_message
  end

  xit "#create adds a peep to the database" do
    timer = double(:fake_timer)
    expect(timer).to receive(:now).and_return('2022-11-04 00:00:00')

    peep_repository = PeepRepository.new(timer)

    new_peep = Peep.new
    new_peep.contents = "I added this peep from RSpec"
    new_peep.account_id = 3

    peep_repository.create(new_peep)

    expect(peep_repository.all).to include(have_attributes(
      id: 6,
      contents: "I added this peep from RSpec",
      time_posted: "2022-11-04 00:00:00",
      account_id: 3
    ))
  end

  xit "#create fails (PG::ForeignKeyViolation) when adding a peep with an invalid account_id" do
    timer = double(:fake_timer)
    expect(timer).to receive(:now).and_return('2022-11-04 00:00:00')

    peep_repository = PeepRepository.new(timer)

    new_peep = Peep.new
    new_peep.contents = "I added this peep from RSpec"
    new_peep.account_id = 4

    expect { peep_repository.create(new_peep) }.to raise_error PG::ForeignKeyViolation
  end

  xit "#create fails (ArgumentError) when the contents are empty" do
    timer = double(:fake_timer)
    expect(timer).to receive(:now).and_return('2022-11-04 00:00:00')

    peep_repository = PeepRepository.new(timer)

    new_peep = Peep.new
    new_peep.contents = ""
    new_peep.account_id = 4

    error_message = "A peep cannot have empty contents"

    expect { peep_repository.create(new_peep) }.to raise_error ArgumentError error_message
  end
end