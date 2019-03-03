require './lib/peep.rb'

describe Peep do
  it 'user adds new peep to database' do
    clean_test_database
    create_dummy_user
    real_id = find_real_user_id
    user = double('User')
    allow(user).to receive(:id).and_return(real_id)
    Peep.add(user_id: real_id, content: "just writing some peeps...")
    @peeps = Peep.all
    p @peeps
    expect(@peeps.first.content).to eq("just writing some peeps...")
  end
end
