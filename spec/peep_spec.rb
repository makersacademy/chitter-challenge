require_relative './spec_helper'
require_relative '../models//peep'

describe Peep do

  it 'adds a peep' do
    peep = Peep.add("Hi, this is a tweet!")[0]
    expect(peep.id).to eq '1'
    expect(peep.content).to eq "Hi, this is a tweet!"
    #p peep.published[0..18]
    #p DateTime.strptime(peep.published[0..18], '%Y-%m-%d %H:%M:%S').strftime("%k:%M:%S %d-%m-%Y")
    #p DateTime.parse(peep.published).strftime("%k:%M:%S %d-%m-%Y")
    expect(peep.published).to eq Time.now.getutc.strftime("%k:%M:%S %d-%m-%Y")
  end

  #it 'adds a peep but provides them in reverse' do
  #
  #end

  it 'lists all the peeps' do
    generate_all_examples
    # generate_examples_wait # USE FOR SLEEP!
    peeps = Peep.all
    expect(peeps[0]).to be_an_instance_of Peep
    expect(peeps).to satisfy { |peep_s| peep_s.size >= 3}
  end

end