require_relative './spec_helper'
require_relative '../models/peep'

describe Peep do

  before 'generate examples' do
    generate_all_examples # 3 peep examples loaded with user profiles
    # generate_examples_wait # USE FOR SLEEP!
  end

  let(:peeps) { Peep.all }

  it 'adds a peep' do
    peep = Peep.add("Hi, this is a tweet!")
    expect(peep.id).to eq '4'
    expect(peep.content).to eq "Hi, this is a tweet!"
    #p peep.published[0..18]
    #p DateTime.strptime(peep.published[0..18], '%Y-%m-%d %H:%M:%S').strftime("%k:%M:%S %d-%m-%Y")
    #p DateTime.parse(peep.published).strftime("%k:%M:%S %d-%m-%Y")
    expect(peep.published).to eq Time.now.getutc.strftime("%k:%M:%S %d-%m-%Y")
  end

  it 'lists all the peeps' do
    expect(peeps[0]).to be_an_instance_of Peep
    expect(peeps[0].owner).to eq "daniel".capitalize
    expect(peeps).to satisfy { |peep_s| peep_s.size >= 3}
  end

  it 'lists in reverse order' do
    expect(peeps[2].content).to eq 'What do you think about this peep?' # is the first peep entered to db
  end

end