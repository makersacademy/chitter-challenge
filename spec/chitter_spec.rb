require 'chitter'

describe Chitter do
  it '#lists peeps' do
    PG.connect(dbname: 'chitter_test')
    Chitter.new_peep("Flounder", "My peep")
    chitter = Chitter.all
    expect(chitter).to include(["Flounder", "My peep", "#{Time.now.to_s[0...-6]}"])
  end
  # describe '#add a peep' do
  # visit('/make_a_peep')
  #   fill_in :user_name, with: "Flounder (post spec)"
  #   fill_in :peep, with: "This is my first peep (post spec)"
  #   click_button('Submit')
  # end
end
