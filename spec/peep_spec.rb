require 'peep'

describe 'Peep' do
  it "returns all peeps" do
    peeps = Peep.all

    expect(peeps).to include("It always seems impossible until it's done. - Nelson Mandela")
    expect(peeps).to include("The greatest glory in living lies not in never falling, but in rising every time we fall. - Nelson Mandela")
    expect(peeps).to include("Something very big has just happened! - Donald Trump")
    expect(peeps).to include("I am slow to learn and slow to forget that which I have learned. My mind is like a piece of steel, very hard to scratch any thing on it and almost impossible after you get it there to rub it out. - Abraham Lincoln")
    expect(peeps).to include("The secret of life is to have no fear. - Fela Kuti")
  end
end
