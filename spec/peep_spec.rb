require 'spec_helper'

describe Peep do

  #Peep.raise_on_save_failure = true

  # The peep is not being saved to the databse.
  # Not sure how to start debuggin this.

  puts "!!!!! #{Peep.count}"

  peep = Peep.create(content: 'Chirp Chirp', creation_date: Time.now)

  puts "!!!!! #{Peep.count}"


  puts peep.saved? ? "SAVED" : "NOOOO"


  it 'exists' do

    expect(peep.content).to eq 'Chirp Chirp'

  end


end