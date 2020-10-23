require 'peep'
require 'database_helpers'
require 'users'

describe Peep do
  before do
    truncates
    add_test_users
  end

  it 'creates a new peep' do
    truncates
    user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')

    peep = Peep.create(text: 'This is a test peep', user_id: user.id)

    persisted_data = persisted_data(table: :peeps, id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.text).to eq 'This is a test peep'
  end

end
