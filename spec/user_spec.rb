require 'user'

RSpec.describe User do
  let(:test_user) { User.new 'Sam123', 'sam@example.com', '1234icecream' }

  it 'has a seperate username' do
    expect(test_user.username).to eq 'Sam123'
  end

  it 'has a login email' do
    expect(test_user.email).to eq 'sam@example.com'
  end

  it 'has a login password' do
    expect(test_user.password).to eq '1234icecream'
  end

  it 'can send a peep' do
    expect { test_user.peep 'this is a peep' }.to change { test_user.all_peeps.length }.by 1
  end

  it 'stores a history of all peeps' do
    test_user.peep 'this is a peep'
    test_user.peep 'this is another peep'

    expect(test_user.all_peeps).to eq ['this is a peep', 'this is another peep']
  end
end
