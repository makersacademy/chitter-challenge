require './lib/peep.rb'

describe Peep do
  it 'user adds new peep to database' do
    clean_test_database
    create_dummy_user
    user = double('User')
    allow(user).to receive(:id).and_return(find_real_user_id)
    Peep.add(user_id: user.id, content: "just writing some peeps...")
    @peeps = Peep.all
    expect(@peeps.first.content).to eq("just writing some peeps...")
  end
end
