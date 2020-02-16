require 'chitter'

describe Chitter do
  it '#lists peeps' do
    PG.connect(dbname: 'chitter_test')
    Chitter.new_peep("Flounder", "My peep")
    chitter = Chitter.all
    expect(chitter).to include(["Flounder", "My peep", "#{Time.now.to_s[0...-6]}"])
  end
end
