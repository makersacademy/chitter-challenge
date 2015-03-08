require 'spec_helper'

describe Peep do

 # peep = Peep.create(content: 'Chirp Chirp', creation_date: Time.now)

  let(:peep) {Peep.create(content: 'Chirp Chirp', creation_date: Time.now)}

  it 'Has textual content' do
    expect(peep.content).to eq 'Chirp Chirp'
  end





end
