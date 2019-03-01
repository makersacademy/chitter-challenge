require './lib/peep.rb'

describe Peep do
  it 'user adds new peep to database' do
    clean_test_database
    Peep.add("mark", "just writing some peeps...")
    @peeps = Peep.all
    # expect last entry to be the one just added
    expect(@peeps[@peeps.length - 1]["peep_content"]).to eq("just writing some peeps...")
  end
end
