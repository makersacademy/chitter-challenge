require 'spec_helper'

describe Peep do

  it 'writes to the database' do
    peep = Peep.new(content: 'Hello world!')
    peep.save
    expect(Peep.last).to eq(peep)
  end
end