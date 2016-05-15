require 'spec_helper'

describe Peep do
  let!(:peep) do
    allow(Time).to receive(:now).and_return('2016-05-08 00:00:00 +0200')
    Peep.create(content: 'Peep', time: Time.now)
  end

  it 'display the creation date on a friendly way' do
    expect(peep.time_format).to eq 'Posted on 05/08/2016 at 12:00AM'
  end

end